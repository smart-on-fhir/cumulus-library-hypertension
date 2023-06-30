-- http://hl7.org/fhir/us/vitals/StructureDefinition/blood-pressure-panel
--
--85354-9	Blood pressure panel with all children optional
-- 8480-6	Systolic blood pressure
-- 8462-4	Diastolic blood pressure
-- 8478-0	Mean blood pressure
-- 8357-6	Blood pressure method
-- 41904-4	Blood pressure measurement site
-- 8358-4	Blood pressure device Cuff size
-- 41901-0	Type of Blood pressure device

create or replace view htn__define_bp as select * from
(VALUES
     ('http://loinc.org', '85354-9',  'Panel Blood Pressure', 'panel')
    ,('http://loinc.org', '8480-6',   'Systolic Blood Pressure', 'systolic')
    ,('http://loinc.org', '8462-4',   'Diastolic Blood Pressure', 'diastolic')
) AS t (system, code, display, component)
;