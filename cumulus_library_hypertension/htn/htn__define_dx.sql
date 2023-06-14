create or replace view htn__define_dx as select * from (values
('http://hl7.org/fhir/sid/icd-10-cm', 'H35.031', 'Hypertensive retinopathy, right eye')
,('http://hl7.org/fhir/sid/icd-10-cm', 'H35.032', 'Hypertensive retinopathy, left eye')
,('http://hl7.org/fhir/sid/icd-10-cm', 'H35.033', 'Hypertensive retinopathy, bilateral')
,('http://hl7.org/fhir/sid/icd-10-cm', 'I10', 'Essential (primary) hypertension')
,('http://hl7.org/fhir/sid/icd-10-cm', 'I11.0', 'Hypertensive heart disease with heart failure')
,('http://hl7.org/fhir/sid/icd-10-cm', 'I11.9', 'Hypertensive heart disease without heart failure')
,('http://hl7.org/fhir/sid/icd-10-cm', 'I12.0', 'Hypertensive chronic kidney disease with stage 5 chronic kidney disease or end stage renal disease')
,('http://hl7.org/fhir/sid/icd-10-cm', 'I12.9', 'Hypertensive chronic kidney disease with stage 1 through stage 4 chronic kidney disease, or unspecified chronic kidney disease')
,('http://hl7.org/fhir/sid/icd-10-cm', 'I13.0', 'Hypertensive heart and chronic kidney disease with heart failure and stage 1 through stage 4 chronic kidney disease, or unspecified chronic kidney disease')
,('http://hl7.org/fhir/sid/icd-10-cm', 'I13.10', 'Hypertensive heart and chronic kidney disease without heart failure, with stage 1 through stage 4 chronic kidney disease, or unspecified chronic kidney disease')
,('http://hl7.org/fhir/sid/icd-10-cm', 'I13.11', 'Hypertensive heart and chronic kidney disease without heart failure, with stage 5 chronic kidney disease, or end stage renal disease')
,('http://hl7.org/fhir/sid/icd-10-cm', 'I13.2', 'Hypertensive heart and chronic kidney disease with heart failure and with stage 5 chronic kidney disease, or end stage renal disease')
,('http://hl7.org/fhir/sid/icd-10-cm', 'I15.0', 'Renovascular hypertension')
,('http://hl7.org/fhir/sid/icd-10-cm', 'I15.1', 'Hypertension secondary to other renal disorders')
,('http://hl7.org/fhir/sid/icd-10-cm', 'I15.2', 'Hypertension secondary to endocrine disorders')
,('http://hl7.org/fhir/sid/icd-10-cm', 'I15.8', 'Other secondary hypertension')
,('http://hl7.org/fhir/sid/icd-10-cm', 'I15.9', 'Secondary hypertension, unspecified')
,('http://hl7.org/fhir/sid/icd-10-cm', 'I27.0', 'Primary pulmonary hypertension')
,('http://hl7.org/fhir/sid/icd-10-cm', 'I27.20', 'Pulmonary hypertension, unspecified')
,('http://hl7.org/fhir/sid/icd-10-cm', 'I27.21', 'Secondary pulmonary arterial hypertension')
,('http://hl7.org/fhir/sid/icd-10-cm', 'I27.22', 'Pulmonary hypertension due to left heart disease')
,('http://hl7.org/fhir/sid/icd-10-cm', 'I27.23', 'Pulmonary hypertension due to lung diseases and hypoxia')
,('http://hl7.org/fhir/sid/icd-10-cm', 'I27.24', 'Chronic thromboembolic pulmonary hypertension')
,('http://hl7.org/fhir/sid/icd-10-cm', 'I27.29', 'Other secondary pulmonary hypertension')
,('http://snomed.info/sct', '10725009', 'Benign hypertension (disorder)')
,('http://snomed.info/sct', '10964002', 'Progressive pulmonary hypertension (disorder)')
,('http://snomed.info/sct', '1201005', 'Benign essential hypertension (disorder)')
,('http://snomed.info/sct', '123799005', 'Renovascular hypertension (disorder)')
,('http://snomed.info/sct', '123800009', 'Goldblatt hypertension (disorder)')
,('http://snomed.info/sct', '14973001', 'Renal sclerosis with hypertension (disorder)')
,('http://snomed.info/sct', '194783001', 'Secondary malignant renovascular hypertension (disorder)')
,('http://snomed.info/sct', '194785008', 'Secondary benign hypertension (disorder)')
,('http://snomed.info/sct', '194788005', 'Hypertension secondary to endocrine disorder (disorder)')
,('http://snomed.info/sct', '194791005', 'Hypertension caused by drug (disorder)')
,('http://snomed.info/sct', '19769006', 'High-renin essential hypertension (disorder)')
,('http://snomed.info/sct', '23130000', 'Paroxysmal hypertension (disorder)')
,('http://snomed.info/sct', '233815004', 'Persistent pulmonary hypertension of the newborn (disorder)')
,('http://snomed.info/sct', '233941006', 'Solitary pulmonary hypertension (disorder)')
,('http://snomed.info/sct', '233942004', 'Small vessel pulmonary hypertension (disorder)')
,('http://snomed.info/sct', '233943009', 'Sporadic primary pulmonary hypertension (disorder)')
,('http://snomed.info/sct', '233944003', 'Familial primary pulmonary hypertension (disorder)')
,('http://snomed.info/sct', '233945002', 'Pulmonary hypertension caused by drug (disorder)')
,('http://snomed.info/sct', '233946001', 'Large vessel pulmonary hypertension (disorder)')
,('http://snomed.info/sct', '234072000', 'Venous hypertension (disorder)')
,('http://snomed.info/sct', '234073005', 'Venous hypertension of upper limb (disorder)')
,('http://snomed.info/sct', '234075003', 'Venous hypertension of lower limb (disorder)')
,('http://snomed.info/sct', '237279007', 'Transient hypertension of pregnancy (disorder)')
,('http://snomed.info/sct', '28119000', 'Renal hypertension (disorder)')
,('http://snomed.info/sct', '288250001', 'Maternal hypertension (disorder)')
,('http://snomed.info/sct', '31992008', 'Secondary hypertension (disorder)')
,('http://snomed.info/sct', '34742003', 'Portal hypertension (disorder)')
,('http://snomed.info/sct', '371125006', 'Labile essential hypertension (disorder)')
,('http://snomed.info/sct', '38341003', 'Hypertensive disorder, systemic arterial (disorder)')
,('http://snomed.info/sct', '39018007', 'Renal arterial hypertension (disorder)')
,('http://snomed.info/sct', '397748008', 'Hypertension with albuminuria (disorder)')
,('http://snomed.info/sct', '398254007', 'Pre-eclampsia (disorder)')
,('http://snomed.info/sct', '4210003', 'Ocular hypertension (disorder)')
,('http://snomed.info/sct', '423674003', 'Chronic peripheral venous hypertension (disorder)')
,('http://snomed.info/sct', '428575007', 'Hypertension secondary to kidney transplant (disorder)')
,('http://snomed.info/sct', '429198000', 'Exertional hypertension (disorder)')
,('http://snomed.info/sct', '429457004', 'Systolic essential hypertension (disorder)')
,('http://snomed.info/sct', '46481004', 'Low-renin essential hypertension (disorder)')
,('http://snomed.info/sct', '46764007', 'Severe pre-eclampsia (disorder)')
,('http://snomed.info/sct', '48146000', 'Diastolic hypertension (disorder)')
,('http://snomed.info/sct', '48194001', 'Pregnancy-induced hypertension (disorder)')
,('http://snomed.info/sct', '52698002', 'Transient hypertension (disorder)')
,('http://snomed.info/sct', '56218007', 'Systolic hypertension (disorder)')
,('http://snomed.info/sct', '57684003', 'Parenchymal renal hypertension (disorder)')
,('http://snomed.info/sct', '59621000', 'Essential hypertension (disorder)')
,('http://snomed.info/sct', '59720008', 'Sustained diastolic hypertension (disorder)')
,('http://snomed.info/sct', '65518004', 'Labile diastolic hypertension (disorder)')
,('http://snomed.info/sct', '68267002', 'Benign intracranial hypertension (disorder)')
,('http://snomed.info/sct', '70272006', 'Malignant hypertension (disorder)')
,('http://snomed.info/sct', '73410007', 'Benign secondary renovascular hypertension (disorder)')
,('http://snomed.info/sct', '74451002', 'Secondary diastolic hypertension (disorder)')
,('http://snomed.info/sct', '78975002', 'Malignant essential hypertension (disorder)')
,('http://snomed.info/sct', '81626002', 'Malignant hypertension in obstetric context (disorder)')
,('http://snomed.info/sct', '84094009', 'Rebound hypertension (disorder)')
,('http://snomed.info/sct', '8762007', 'Chronic hypertension in obstetric context (disorder)')
,('http://snomed.info/sct', '89242004', 'Malignant secondary hypertension (disorder)')
) AS t (system, code, display) ;