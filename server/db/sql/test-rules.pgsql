-- Test rule no_person
DO $$
begin
raise notice '=== Testing rule no_person ===';
end;
$$;
insert into person(pId)
values(1);

-- Test rule area_led_update
DO $$
begin
raise notice '=== Testing rule area_led_update ===';
end;
$$;
update area
set ledBy = 6
where name = 'Pediatrics';

-- Test rule doctor_salary
DO $$
begin
raise notice '=== Testing rule doctor_salary ===';
end;
$$;
update doctor
set yearsExperience = yearsExperience + 1
where pId = 13;

-- Test rule doctor_changeAreas
DO $$
begin
raise notice '=== Testing rule doctor_changeAreas ===';
end;
$$;
update doctor
set worksAt = 'Pediatrics'::specialties_t
where pId = 11;

-- Test rule doctor_areaWorkspeciality_update
DO $$
begin
raise notice '=== Testing rule doctor_areaWorkspeciality_update ===';
end;
$$;
update doctor
set worksAt = 'General Medicine'
where pId = 10;

-- Test rule insurance_limitPremium_insert
DO $$
begin
raise notice '=== Testing rule insurance_limitPremium_insert ===';
end;
$$;
insert into treatment (prescribedBy, receivedBy, duration)
values(11, 2, '1990-11-02');

-- Test rule insurance_limitBasic_insert
DO $$
begin
raise notice '=== Testing rule insurance_limitBasic_insert ===';
end;
$$;
insert into treatment (prescribedBy, receivedBy, duration)
values(13, 1, '1990-11-02');
