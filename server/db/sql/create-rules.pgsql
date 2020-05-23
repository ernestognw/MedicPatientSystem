-- A doctor can be leader only of the Area he/she works on
create or replace rule area_lead_update as
on update to area where old.name <> (
	select worksAt
	from doctor
	where pId = old.ledBy
)
do instead select r('El jefe de un area debe trabajar para esa area.');


-- Every time a doctor accumulates two years of experience he/she receive a salary increment of 10% 
create or replace function raiseDoctorSalary() returns trigger as $$
begin
	if NEW.yearsExperience % 2 = 0 then
		NEW.monthlySalary = NEW.monthlySalary * 1.1;
	end if;
    return NEW;
end;
$$ language plpgsql;

create trigger doctor_salary
before update of yearsExperience on doctor
for each row
execute procedure raiseDoctorSalary();


/* It is possible that a doctor changes his/her Area with in the hospital. 
If the doctor was the leader of the original area, then such an area must 
select a new leader.

To select a new leader, the older one is selected
*/
create or replace rule doctor_changeAreas as
on update to doctor 
where old.worksAt <> new.worksAt and new.pId = (select ledBy from area where name = old.worksAt)
do
	update area 
	set ledBy = (
		select d.pId
		from doctor d
		where d.worksAt = old.worksAt and pId <> new.pId  
		order by yearsExperience desc
		fetch first 1 rows only
	)
	where name = old.worksAt;

-- A doctor may be associated only to hospital areas that are part of his-her pecialties.
create or replace rule doctor_areaWorkspeciality_insert as
on insert to doctor
where (new.worksAt <> new.speciality)
do instead
	select r('Los doctores solo deben trabajar en un area que pertenezca a sus especialidades.');

create or replace rule doctor_areaWorkspeciality_update as
on update to doctor
where (new.worksAt <> new.speciality)
do instead
	select r('Los doctores solo deben trabajar en un area que pertenezca a sus especialidades.');

-- Premium insurance allows patients to receive treatments for all areas except Radiology.
create or replace rule insurance_limitPremium_insert as
on insert to treatment
where (
	select insurancePlan 
	from patient
	where pId = new.receivedBy
) = 'Premium'::plan_t and 'Radiology'::specialties_t = (
	select worksAt
	from doctor
	where pId = new.prescribedBy
) 
do instead select r('El seguro Premium no cubre este tratamiento, no se registró.');

create or replace rule insurance_limitPremium_update as
on update to treatment
where (
	select insurancePlan 
	from patient
	where pId = new.receivedBy
) = 'Premium'::plan_t and 'Radiology'::specialties_t = (
	select worksAt
	from doctor
	where pId = new.prescribedBy
) 
do instead select r('El seguro Premium no cubre este tratamiento, no se registró.');

-- Basic Insurance covers only General Medicine, Obstetrics and Pediatrics.
create or replace rule insurance_limitBasic_insert as
on insert to treatment
where (
	select insurancePlan 
	from patient
	where pId = new.receivedBy
) = 'Basic'::plan_t and (
	select worksAt
	from doctor
	where pId = new.prescribedBy
) not in (select unnest(array['General Medicine'::specialties_t, 'Obstetrics'::specialties_t, 'Pediatrics'::specialties_t]))
do instead select r('El seguro Basic no cubre este tratamiento, no se registró.');

create or replace rule insurance_limitBasic_update as
on update to treatment
where (
	select insurancePlan 
	from patient
	where pId = new.receivedBy
) = 'Basic'::plan_t and (
	select worksAt
	from doctor
	where pId = new.prescribedBy
) not in (select unnest(array['General Medicine'::specialties_t, 'Obstetrics'::specialties_t, 'Pediatrics'::specialties_t]))
do instead select r('El seguro Basic no cubre este tratamiento, no se registró.');