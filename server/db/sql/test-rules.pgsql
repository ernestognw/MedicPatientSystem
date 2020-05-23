-- Test rule no_person
select r('*** Test rule no_person');
insert into person(pId)
values('E1');

-- Test rule area_lead_update
select r('*** Test rule area_lead_update');
update area
set leadBy = 'D2'
where name = 'Pediatrics';

-- Test rule doctor_salary
select r('*** Test rule doctor_salary');
update doctor
set yearsExperience = yearsExperience + 1
where pId = 'D1';

-- Test rule doctor_changeAreas
select r('*** Test rule doctor_changeAreas');
update doctor
set worksAt = 'Pediatrics'::medical_area
where pId = 'D7';

-- Test rule doctor_areaWorkspeciality_update
select r('*** Test rule doctor_areaWorkspeciality_update');
update doctor
set worksAt = 'General Medicine'
where pId = 'D3';

-- Test rule insurance_limitPremium_insert
select r('*** Test rule insurance_limitPremium_insert');
insert into treatment (prescribedBy, givenTo, duration, medicines)
values('D11', 'P2', 5, array['cataflam', 'antifludes']);

-- Test rule insurance_limitBasic_insert
select r('*** Test rule insurance_limitBasic_insert');
insert into treatment (prescribedBy, givenTo, duration, medicines)
values('D8', 'P1', 5, array['cataflam', 'antifludes']);
