create or replace view htn__define_enc_icu as select * from (values
('http://snomed.info/sct', '448951000124107', 'Admission to observation unit (procedure)')
,('http://snomed.info/sct', '309904001', 'Intensive care unit (environment)')
,('http://snomed.info/sct', '309905000', 'Adult intensive care unit (environment)')
,('http://snomed.info/sct', '309907008', 'Cardiac intensive care unit (environment)')
,('http://snomed.info/sct', '309908003', 'Metabolic intensive care unit (environment)')
,('http://snomed.info/sct', '309909006', 'Neurological intensive care unit (environment)')
,('http://snomed.info/sct', '309910001', 'Pediatric intensive care unit (environment)')
,('http://snomed.info/sct', '309911002', 'Respiratory intensive care unit (environment)')
,('http://snomed.info/sct', '418433008', 'Surgical intensive care unit (environment)')
,('http://snomed.info/sct', '426439001', 'Burns intensive care unit (environment)')
,('http://snomed.info/sct', '441994008', 'Medical intensive care unit (environment)')
,('http://snomed.info/sct', '448391000124102', 'Trauma intensive care unit (environment)')
) AS t (system, code, display) ;