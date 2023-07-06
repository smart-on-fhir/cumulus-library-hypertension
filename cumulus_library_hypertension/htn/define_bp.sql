-- http://hl7.org/fhir/us/vitals/StructureDefinition/blood-pressure-panel
--
--85354-9	Blood pressure panel
-- 8480-6	Systolic blood pressure
-- 8462-4	Diastolic blood pressure

create or replace view htn__define_bp as select * from
(VALUES
     ('http://loinc.org', '85354-9',  'Panel Blood Pressure', 'panel')
    ,('http://loinc.org', '8480-6',   'Systolic Blood Pressure', 'systolic')
    ,('http://loinc.org', '8462-4',   'Diastolic Blood Pressure', 'diastolic')
) AS t (system, code, display, component)
;