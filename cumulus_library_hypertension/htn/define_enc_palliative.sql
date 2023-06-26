create or replace view htn__define_enc_palliative as select * from (values
('http://www.nlm.nih.gov/research/umls/hcpcs', 'G9054', 'Oncology. primary focus of visit. supervising, coordinating or managing care of patient with terminal cancer or for whom other medical illness prevents further cancer treatment. includes symptom management, end-of-life care planning, management of palliative therapies (for use in a medicare-approved demonstration project)')
,('http://www.nlm.nih.gov/research/umls/hcpcs', 'M1017', 'Patient admitted to palliative care services')
,('http://snomed.info/sct', '305284002', 'Admission by palliative care physician (procedure)')
,('http://snomed.info/sct', '305381007', 'Admission to palliative care department (procedure)')
,('http://snomed.info/sct', '4901000124101', 'Palliative care education (procedure)')
,('http://snomed.info/sct', '713281006', 'Consultation for palliative care (procedure)')
) AS t (system, code, display) ;