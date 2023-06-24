create or replace view htn__define_esrd as select * from (values
('http://hl7.org/fhir/sid/icd-10-cm', 'N18.5', 'Chronic kidney disease, stage 5')
,('http://hl7.org/fhir/sid/icd-10-cm', 'N18.6', 'End stage renal disease')
,('http://hl7.org/fhir/sid/icd-10-cm', 'Z99.2', 'Dependence on renal dialysis')
,('http://snomed.info/sct', '111411000119103', 'End stage renal disease due to hypertension (disorder)')
,('http://snomed.info/sct', '120261000119101', 'Benign hypertensive heart disease and chronic renal disease stage 5 (disorder)')
,('http://snomed.info/sct', '127991000119101', 'Hypertension concurrent and due to end stage renal disease on dialysis due to type 2 diabetes mellitus (disorder)')
,('http://snomed.info/sct', '128001000119105', 'Hypertension concurrent and due to end stage renal disease on dialysis due to type 1 diabetes mellitus (disorder)')
,('http://snomed.info/sct', '129161000119100', 'Chronic kidney disease stage 5 due to hypertension (disorder)')
,('http://snomed.info/sct', '140101000119109', 'Hypertension in chronic kidney disease stage 5 due to type 2 diabetes mellitus (disorder)')
,('http://snomed.info/sct', '153851000119106', 'Malignant hypertensive chronic kidney disease stage 5 (disorder)')
,('http://snomed.info/sct', '153891000119101', 'End stage renal disease on dialysis due to hypertension (disorder)')
,('http://snomed.info/sct', '236434000', 'End stage renal failure untreated by renal replacement therapy (disorder)')
,('http://snomed.info/sct', '236435004', 'End stage renal failure on dialysis (disorder)')
,('http://snomed.info/sct', '236436003', 'End stage renal failure with renal transplant (disorder)')
,('http://snomed.info/sct', '285011000119108', 'Chronic kidney disease stage 5 due to benign hypertension (disorder)')
,('http://snomed.info/sct', '285841000119104', 'Malignant hypertensive end stage renal disease (disorder)')
,('http://snomed.info/sct', '286371000119107', 'Malignant hypertensive end stage renal disease on dialysis (disorder)')
,('http://snomed.info/sct', '368461000119103', 'Chronic kidney disease stage 5 due to drug induced diabetes mellitus (disorder)')
,('http://snomed.info/sct', '368471000119109', 'End stage renal disease on dialysis due to drug induced diabetes mellitus (disorder)')
,('http://snomed.info/sct', '428937001', 'Dependence on peritoneal dialysis due to end stage renal disease (finding)')
,('http://snomed.info/sct', '428982002', 'Dependence on hemodialysis due to end stage renal disease (finding)')
,('http://snomed.info/sct', '429075005', 'Dependence on dialysis due to end stage renal disease (finding)')
,('http://snomed.info/sct', '433146000', 'Chronic kidney disease stage 5 (disorder)')
,('http://snomed.info/sct', '434431000124103', 'Hypertensive end stage renal disease (disorder)')
,('http://snomed.info/sct', '46177005', 'End-stage renal disease (disorder)')
,('http://snomed.info/sct', '698810000', 'Hypertensive renal disease with end stage renal failure (disorder)')
,('http://snomed.info/sct', '704667004', 'Hypertension concurrent and due to end stage renal disease on dialysis (disorder)')
,('http://snomed.info/sct', '707324008', 'Anemia co-occurrent and due to end stage renal disease (disorder)')
,('http://snomed.info/sct', '711000119100', 'Chronic kidney disease stage 5 due to type 2 diabetes mellitus (disorder)')
,('http://snomed.info/sct', '712487000', 'End stage renal disease due to benign hypertension (disorder)')
,('http://snomed.info/sct', '714152005', 'Chronic kidney disease stage 5 on dialysis (disorder)')
,('http://snomed.info/sct', '714153000', 'Chronic kidney disease stage 5 with transplant (disorder)')
,('http://snomed.info/sct', '90761000119106', 'Chronic kidney disease stage 5 due to type 1 diabetes mellitus (disorder)')
,('http://snomed.info/sct', '90771000119100', 'End stage renal disease on dialysis due to type 1 diabetes mellitus (disorder)')
,('http://snomed.info/sct', '90791000119104', 'End stage renal disease on dialysis due to type 2 diabetes mellitus (disorder)')
,('http://snomed.info/sct', '96711000119105', 'Hypertensive heart AND chronic kidney disease stage 5 (disorder)')
,('http://www.nlm.nih.gov/research/umls/hcpcs', 'G9231', 'Documentation of end stage renal disease (esrd), dialysis, renal transplant before or during the measurement period or pregnancy during the measurement period')
,('http://snomed.info/sct', '175899003', 'Autotransplantation of kidney (procedure)')
,('http://snomed.info/sct', '175901007', 'Live donor renal transplant (procedure)')
,('http://snomed.info/sct', '175902000', 'Cadaveric renal transplant (procedure)')
,('http://snomed.info/sct', '236138007', 'Xenograft renal transplant (procedure)')
,('http://snomed.info/sct', '313030004', 'Donor renal transplantation (procedure)')
,('http://snomed.info/sct', '52213001', 'Renal homotransplantation excluding donor and recipient nephrectomy (procedure)')
,('http://snomed.info/sct', '6471000179103', 'Transplantation of kidney and pancreas (procedure)')
,('http://snomed.info/sct', '70536003', 'Transplant of kidney (procedure)')
,('http://snomed.info/sct', '711411006', 'Allotransplantation of kidney from beating heart cadaver (procedure)')
,('http://snomed.info/sct', '711413009', 'Allotransplantation of kidney from non-beating heart cadaver (procedure)')
,('http://snomed.info/sct', '765478004', 'Allotransplantation of left kidney (procedure)')
,('http://snomed.info/sct', '765479007', 'Allotransplantation of right kidney (procedure)')
,('http://snomed.info/sct', '782655004', 'Laparoscopic transplant of kidney using robotic assistance (procedure)')
,('http://hl7.org/fhir/sid/icd-10-cm', 'Z94.0', 'Kidney transplant status')
,('http://www.cms.gov/Medicare/Coding/ICD10', '0TY00Z0', 'Transplantation of Right Kidney, Allogeneic, Open Approach')
,('http://www.cms.gov/Medicare/Coding/ICD10', '0TY00Z1', 'Transplantation of Right Kidney, Syngeneic, Open Approach')
,('http://www.cms.gov/Medicare/Coding/ICD10', '0TY00Z2', 'Transplantation of Right Kidney, Zooplastic, Open Approach')
,('http://www.cms.gov/Medicare/Coding/ICD10', '0TY10Z0', 'Transplantation of Left Kidney, Allogeneic, Open Approach')
,('http://www.cms.gov/Medicare/Coding/ICD10', '0TY10Z1', 'Transplantation of Left Kidney, Syngeneic, Open Approach')
,('http://www.cms.gov/Medicare/Coding/ICD10', '0TY10Z2', 'Transplantation of Left Kidney, Zooplastic, Open Approach')
) AS t (system, code, display) ;