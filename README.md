# Hypertension Case Definition
This definition attempts to "multi-solve" counting HTN cases for CDC and CMS use. 

* CDC chronic disease management
  > "Hypertension is generally defined as systolic blood pressure ≥140 mmHg, or diastolic blood pressure ≥90 mmHg. A person who currently uses blood pressure-lowering medication is also defined as having hypertension."
  > Source: [CDC Grand Rounds: A Public Health Approach to Detect and Control Hypertension](https://www.cdc.gov/mmwr/volumes/65/wr/mm6545a3.htm)
  
* CMS Quality Measures 
  * [Controlling High Blood Pressure CMS Quality #236 (NQF 0018)](https://docs.google.com/spreadsheets/d/1UTxg-MvAf0xMBI8dAw6SEF1cQduZqC330R-0MOAWli4/edit#gid=1986332053)
  
-----
**COUNT TABLES**

Count number of patients per month matching criteria
* _htn__count_bp_month_ : BP (blood pressure) measures
* _htn__count_dx_month_ : HTN diagnosis codes 
* _htn__count_rx_month_ : HTN blood pressure control meds



| **htn__count_bp_month** | [Blood Pressure Panel](http://hl7.org/fhir/us/vitals/STU1/StructureDefinition-blood-pressure-panel.html)                         |
|-------------------------|----------------------------------------------------------------------------------------------------------------------------------|
| cnt                     | count number of patients                                                                                                         |
| obs_month               | Month of BP observation                                                                                                          |
| hypertension            | BP is 140/90 or higher (true or false)                                                                                           |           | 
| hypotension             | BP is 90/60  or lower (true or false)                                                                                            |
| enc_class_code          | [Encounter class](https://terminology.hl7.org/5.1.0/ValueSet-encounter-class.html) ambulatory, emergency, impatient, observation | 
| gender                  | [female or male sex](http://hl7.org/fhir/ValueSet/administrative-gender)                                                         |
| age_at_visit            | patient age at time of visit                                                                                                     |
| race_display            | [CDC R5 race](http://hl7.org/fhir/us/core/StructureDefinition/us-core-race)                                                      |
| ethnicity_display       | [Hispanic or Latino](http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity)                                          |

| **htn__count_dx_month** | Hypertension diagnosis (ICD10-CM or SNOMED-CT)                                                                                   |
|-------------------------|----------------------------------------------------------------------------------------------------------------------------------|
| cnt                     | count number of patients                                                                                                         |
| cond_month              | Month of HTN diagnosis                                                                                                           |
| cond_display            | Display the label of HTN diagnosis                                                                                               |
| cond_system_display     | SNOMED-CT or ICD-10-CM                                                                                                           |                                                                                                          |
| enc_class_code          | [Encounter class](https://terminology.hl7.org/5.1.0/ValueSet-encounter-class.html) ambulatory, emergency, impatient, observation | 
| gender                  | female or male sex                                                                                                               |
| age_at_visit            | patient age at time of visit                                                                                                     |
| race_display            | CDC R5 code                                                                                                                      |
| ethnicity_display       | Hispanic or Latino                                                                                                               |


| **htn__count_rx_month** | Blood Pressure Medications                                                                                 |
|-------------------------|------------------------------------------------------------------------------------------------------------|
| cnt                     | count number of patients                                                                                   |
| authoredon_month        | Month of medication request                                                                                |
| rx_display              | Display RXNORM drug label                                                                                  |
| rx_category_code        | [inpatient, outpatient, or community](https://hl7.org/fhir/valueset-medicationrequest-admin-location.html) |                                                                                                          |


-----

**DIAGNOSIS**

DX of primary essential HTN preferred. 

Initial HTN diagnosis may not be available/recorded at the health system, therefore, progression of HTN including pathologies to other organ systems is considered. 
HTN with heart disease, chronic kidney disease, or secondary HTN also meet inclusion criteria.


**Include**
* I10 essential hypertension
* I11 Hypertensive heart disease with heart failure
* I12 Hypertensive chronic kidney disease
* I13 Hypertensive heart and chronic kidney disease
* I15 Secondary hypertension

**Insufficient** 
* [R03](https://www.icd10data.com/ICD10CM/Codes/R00-R99/R00-R09/R03-/R03.0) Elevated blood-pressure reading, without diagnosis of hypertension
* I27 Pulmonary Hypertension 
* G93 Benign intracranial hypertension
* H40.05 Ocular Hypertension
 
**Exclude** (CMS)
* ESRD End Stage Renal Disease (CKD stage-5)

-----

**BLOOD PRESSURE**

BP readings should be from outpatient settings NOT an ED or inpatient visit.   
One (1) high blood pressure reading is enough for inclusion critiera.

**Include**
* Systolic >= 140
* Diastolic >= 90

**Exclude**
* Inpatient encounter
* ED encounter 

-----
**MEDICATION** 

Blood pressure control drugs are _included_ for CDC but _insufficient_ for CMS criteria.

CMS _excludes_ blood pressure measures on encounters where certain substances are present that may affect BP readings. 

**Include** (CDC)
* ACE Inhibitors
* ARB Blockers
* Beta Blockers
* Calcium Channel Blockers
* Diuretics

**Insufficient**
* Statins

**Exclude** (CMS)
* Cholinesterase Inhibitors
* CNS agents
* Dementia drugs

-----
**ENCOUNTER** 

BP measures from inpatient stays and ED visits should are _insufficient_. 

**Include**

* Hypertension Screening
* Office Visit
* Home Visit
* Wellness Visit
* Preventive Care

**Exclude** (CMS)

* Inpatient
* Palliative care 
* Hospice services

_Patients with excessive morbidity burden._

* Frailty
* Renal transplant/service