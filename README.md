# Hypertension Case Definition
This definition attempts to "multi-solve" counting HTN cases for CDC and CMS use. 

* CDC chronic disease management
  > "Hypertension is generally defined as systolic blood pressure ≥140 mmHg, or diastolic blood pressure ≥90 mmHg. A person who currently uses blood pressure-lowering medication is also defined as having hypertension."
  > Source: [CDC Grand Rounds: A Public Health Approach to Detect and Control Hypertension](https://www.cdc.gov/mmwr/volumes/65/wr/mm6545a3.htm)
  
* CMS Quality Measures 
  * [Controlling High Blood Pressure CMS Quality #236 (NQF 0018)](https://docs.google.com/spreadsheets/d/1UTxg-MvAf0xMBI8dAw6SEF1cQduZqC330R-0MOAWli4/edit#gid=1986332053)
  
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
* Vaccinations
* Injections

-----
**ENCOUNTER** 

BP measures from inpatient stays and ED visits should are _insufficient_. 

**Include** (CMS)

* Hypertension Screening

**Exclude** (CMS)

_Services that affect BP measures._

* Tuberculosis Test
* IUD Insertion
* Eye Exam
* Wart/Mole removal

_Patients with excessive morbidity burden._

* Frailty
* Palliative care 
* Hospice services
* Renal transplant/service

