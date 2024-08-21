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
,('http://www.ama-assn.org/go/cpt', '90935', 'Hemodialysis procedure with single evaluation by a physician or other qualified health care professional')
,('http://www.ama-assn.org/go/cpt', '90937', 'Hemodialysis procedure requiring repeated evaluation(s) with or without substantial revision of dialysis prescription')
,('http://www.ama-assn.org/go/cpt', '90945', 'Dialysis procedure other than hemodialysis (eg, peritoneal dialysis, hemofiltration, or other continuous renal replacement therapies), with single evaluation by a physician or other qualified health care professional')
,('http://www.ama-assn.org/go/cpt', '90947', 'Dialysis procedure other than hemodialysis (eg, peritoneal dialysis, hemofiltration, or other continuous renal replacement therapies) requiring repeated evaluations by a physician or other qualified health care professional, with or without substantial revision of dialysis prescription')
,('http://www.ama-assn.org/go/cpt', '90997', 'Hemoperfusion (eg, with activated charcoal or resin)')
,('http://www.ama-assn.org/go/cpt', '90999', 'Unlisted dialysis procedure, inpatient or outpatient')
,('http://www.ama-assn.org/go/cpt', '99512', 'Home visit for hemodialysis')
,('http://www.nlm.nih.gov/research/umls/hcpcs', 'G0257', 'Unscheduled or emergency dialysis treatment for an esrd patient in a hospital outpatient department that is not certified as an esrd facility')
,('http://www.nlm.nih.gov/research/umls/hcpcs', 'S9339', 'Home therapy. peritoneal dialysis, administrative services, professional pharmacy services, care coordination and all necessary supplies and equipment (drugs and nursing visits coded separately), per diem')
,('http://snomed.info/sct', '108241001', 'Dialysis procedure (procedure)')
,('http://snomed.info/sct', '10848006', 'Removal of peritoneal dialysis catheter (procedure)')
,('http://snomed.info/sct', '11932001', 'Stabilizing hemodialysis (procedure)')
,('http://snomed.info/sct', '14684005', 'Peritoneal dialysis excluding cannulation (procedure)')
,('http://snomed.info/sct', '180273006', 'Removal of chronic ambulatory peritoneal dialysis catheter (procedure)')
,('http://snomed.info/sct', '225230008', 'Chronic peritoneal dialysis (procedure)')
,('http://snomed.info/sct', '225231007', 'Stab peritoneal dialysis (procedure)')
,('http://snomed.info/sct', '233575001', 'Intermittent hemodialysis (procedure)')
,('http://snomed.info/sct', '233576000', 'Intermittent hemodialysis with sequential ultrafiltration (procedure)')
,('http://snomed.info/sct', '233577009', 'Intermittent hemodialysis with continuous ultrafiltration (procedure)')
,('http://snomed.info/sct', '233578004', 'Continuous hemodialysis (procedure)')
,('http://snomed.info/sct', '233579007', 'Continuous arteriovenous hemodialysis (procedure)')
,('http://snomed.info/sct', '233580005', 'Continuous venovenous hemodialysis (procedure)')
,('http://snomed.info/sct', '233581009', 'Hemofiltration (procedure)')
,('http://snomed.info/sct', '233582002', 'Intermittent hemofiltration (procedure)')
,('http://snomed.info/sct', '233583007', 'Continuous hemofiltration (procedure)')
,('http://snomed.info/sct', '233584001', 'Continuous arteriovenous hemofiltration (procedure)')
,('http://snomed.info/sct', '233585000', 'Continuous venovenous hemofiltration (procedure)')
,('http://snomed.info/sct', '233586004', 'Hemodiafiltration (procedure)')
,('http://snomed.info/sct', '233587008', 'Intermittent hemodiafiltration (procedure)')
,('http://snomed.info/sct', '233588003', 'Continuous hemodiafiltration (procedure)')
,('http://snomed.info/sct', '233589006', 'Continuous arteriovenous hemodiafiltration (procedure)')
,('http://snomed.info/sct', '233590002', 'Continuous venovenous hemodiafiltration (procedure)')
,('http://snomed.info/sct', '238316008', 'Aspiration of chronic ambulatory peritoneal dialysis catheter (procedure)')
,('http://snomed.info/sct', '238317004', 'Flushing of chronic ambulatory peritoneal dialysis catheter (procedure)')
,('http://snomed.info/sct', '238318009', 'Continuous ambulatory peritoneal dialysis (procedure)')
,('http://snomed.info/sct', '238319001', 'Continuous cycling peritoneal dialysis (procedure)')
,('http://snomed.info/sct', '238321006', 'Intermittent peritoneal dialysis (procedure)')
,('http://snomed.info/sct', '238322004', 'Tidal peritoneal dialysis (procedure)')
,('http://snomed.info/sct', '238323009', 'Night-time intermittent peritoneal dialysis (procedure)')
,('http://snomed.info/sct', '265764009', 'Renal dialysis (procedure)')
,('http://snomed.info/sct', '288182009', 'Extracorporeal kidney (procedure)')
,('http://snomed.info/sct', '302497006', 'Hemodialysis (procedure)')
,('http://snomed.info/sct', '34897002', 'Hemodialysis, maintenance in hospital (procedure)')
,('http://snomed.info/sct', '427053002', 'Extracorporeal albumin hemodialysis (procedure)')
,('http://snomed.info/sct', '428648006', 'Automated peritoneal dialysis (procedure)')
,('http://snomed.info/sct', '439278006', 'Measurement of static venous pressure in hemodialysis vascular access (procedure)')
,('http://snomed.info/sct', '439976001', 'Measurement of recirculation in hemodialysis vascular access (procedure)')
,('http://snomed.info/sct', '57274006', 'Initial hemodialysis (procedure)')
,('http://snomed.info/sct', '676002', 'Peritoneal dialysis including cannulation (procedure)')
,('http://snomed.info/sct', '67970008', 'Hemodialysis, maintenance at home (procedure)')
,('http://snomed.info/sct', '68341005', 'Hemodialysis, supervision at home (procedure)')
,('http://snomed.info/sct', '71192002', 'Peritoneal dialysis (procedure)')
,('http://snomed.info/sct', '714749008', 'Continuous renal replacement therapy (procedure)')
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