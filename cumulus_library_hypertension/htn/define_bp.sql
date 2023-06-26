-- http://hl7.org/fhir/us/vitals/StructureDefinition/blood-pressure-panel
--
--85354-9	Blood pressure panel with all children optional (PANEL)
-- 8480-6	Systolic blood pressure
-- 8462-4	Diastolic blood pressure
-- 8478-0	Mean blood pressure
-- 8357-6	Blood pressure method
-- 41904-4	Blood pressure measurement site
-- 8358-4	Blood pressure device Cuff size
-- 41901-0	Type of Blood pressure device

create or replace view htn__define_bp_systolic as select * from
(VALUES
     ('http://loinc.org', '8480-6',   'Systolic blood pressure')
    ,('http://loinc.org', '76534-7',  'Intravascular systolic')
) AS t (system, code, display)
;

create or replace view htn__define_bp_diastolic as select * from
(VALUES
     ('http://loinc.org', '8462-4',   'Diastolic blood pressure')
    ,('http://loinc.org', '76535-4',  'Intravascular diastolic')
) AS t (system, code, display)
;