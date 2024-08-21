create or replace view htn__define_enc_inpatient as select * from (values
('http://www.ama-assn.org/go/cpt', '99221', 'Initial hospital inpatient or observation care, per day, for the evaluation and management of a patient, which requires a medically appropriate history and/or examination and straightforward or low level medical decision making. When using total time on the date of the encounter for code selection, 40 minutes must be met or exceeded.')
,('http://www.ama-assn.org/go/cpt', '99222', 'Initial hospital inpatient or observation care, per day, for the evaluation and management of a patient, which requires a medically appropriate history and/or examination and moderate level of medical decision making. When using total time on the date of the encounter for code selection, 55 minutes must be met or exceeded.')
,('http://www.ama-assn.org/go/cpt', '99223', 'Initial hospital inpatient or observation care, per day, for the evaluation and management of a patient, which requires a medically appropriate history and/or examination and high level of medical decision making. When using total time on the date of the encounter for code selection, 75 minutes must be met or exceeded.')
,('http://www.ama-assn.org/go/cpt', '99231', 'Subsequent hospital inpatient or observation care, per day, for the evaluation and management of a patient, which requires a medically appropriate history and/or examination and straightforward or low level of medical decision making. When using total time on the date of the encounter for code selection, 25 minutes must be met or exceeded.')
,('http://www.ama-assn.org/go/cpt', '99232', 'Subsequent hospital inpatient or observation care, per day, for the evaluation and management of a patient, which requires a medically appropriate history and/or examination and moderate level of medical decision making. When using total time on the date of the encounter for code selection, 35 minutes must be met or exceeded.')
,('http://www.ama-assn.org/go/cpt', '99233', 'Subsequent hospital inpatient or observation care, per day, for the evaluation and management of a patient, which requires a medically appropriate history and/or examination and high level of medical decision making. When using total time on the date of the encounter for code selection, 50 minutes must be met or exceeded.')
,('http://www.ama-assn.org/go/cpt', '99234', 'Hospital inpatient or observation care, for the evaluation and management of a patient including admission and discharge on the same date, which requires a medically appropriate history and/or examination and straightforward or low level of medical decision making. When using total time on the date of the encounter for code selection, 45 minutes must be met or exceeded.')
,('http://www.ama-assn.org/go/cpt', '99235', 'Hospital inpatient or observation care, for the evaluation and management of a patient including admission and discharge on the same date, which requires a medically appropriate history and/or examination and moderate level of medical decision making. When using total time on the date of the encounter for code selection, 70 minutes must be met or exceeded.')
,('http://www.ama-assn.org/go/cpt', '99236', 'Hospital inpatient or observation care, for the evaluation and management of a patient including admission and discharge on the same date, which requires a medically appropriate history and/or examination and high level of medical decision making. When using total time on the date of the encounter for code selection, 85 minutes must be met or exceeded.')
,('http://www.ama-assn.org/go/cpt', '99238', 'Hospital inpatient or observation discharge day management. 30 minutes or less on the date of the encounter')
,('http://www.ama-assn.org/go/cpt', '99239', 'Hospital inpatient or observation discharge day management. more than 30 minutes on the date of the encounter')
,('http://www.ama-assn.org/go/cpt', '99251', 'Inpatient consultation for a new or established patient, which requires these 3 key components: A problem focused history. A problem focused examination. and Straightforward medical decision making. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patients and/or familys needs. Usually, the presenting problem(s) are self limited or minor. Typically, 20 minutes are spent at the bedside and on the patients hospital floor or unit.')
,('http://www.ama-assn.org/go/cpt', '99252', 'Inpatient or observation consultation for a new or established patient, which requires a medically appropriate history and/or examination and straightforward medical decision making. When using total time on the date of the encounter for code selection, 35 minutes must be met or exceeded.')
,('http://www.ama-assn.org/go/cpt', '99253', 'Inpatient or observation consultation for a new or established patient, which requires a medically appropriate history and/or examination and low level of medical decision making. When using total time on the date of the encounter for code selection, 45 minutes must be met or exceeded.')
,('http://www.ama-assn.org/go/cpt', '99254', 'Inpatient or observation consultation for a new or established patient, which requires a medically appropriate history and/or examination and moderate level of medical decision making. When using total time on the date of the encounter for code selection, 60 minutes must be met or exceeded.')
,('http://www.ama-assn.org/go/cpt', '99255', 'Inpatient or observation consultation for a new or established patient, which requires a medically appropriate history and/or examination and high level of medical decision making. When using total time on the date of the encounter for code selection, 80 minutes must be met or exceeded.')
,('http://www.ama-assn.org/go/cpt', '99291', 'Critical care, evaluation and management of the critically ill or critically injured patient. first 30-74 minutes')
,('http://snomed.info/sct', '10531005', 'Free-standing ambulatory surgery facility (environment)')
,('http://snomed.info/sct', '108344006', 'Nursing home AND/OR ambulatory care site (environment)')
,('http://snomed.info/sct', '18095007', 'Intermediate care hospital for mentally retarded (environment)')
,('http://snomed.info/sct', '20078004', 'Substance abuse treatment center (environment)')
,('http://snomed.info/sct', '20316001', 'Tertiary care hospital (environment)')
,('http://snomed.info/sct', '2081004', 'Hospital ship (environment)')
,('http://snomed.info/sct', '22232009', 'Hospital (environment)')
,('http://snomed.info/sct', '224687002', 'Prison hospital (environment)')
,('http://snomed.info/sct', '224881003', 'Charitable nursing home (environment)')
,('http://snomed.info/sct', '224924009', 'Cottage hospital (environment)')
,('http://snomed.info/sct', '224929004', 'Secure hospital (environment)')
,('http://snomed.info/sct', '225732001', 'Community hospital (environment)')
,('http://snomed.info/sct', '284546000', 'Hospice (environment)')
,('http://snomed.info/sct', '288561005', 'Special hospital (environment)')
,('http://snomed.info/sct', '309895006', 'Private hospital (environment)')
,('http://snomed.info/sct', '309896007', 'Tertiary referral hospital (environment)')
,('http://snomed.info/sct', '309897003', 'Psychiatric day care hospital (environment)')
,('http://snomed.info/sct', '309898008', 'Psychogeriatric day hospital (environment)')
,('http://snomed.info/sct', '309899000', 'Elderly severely mentally ill day hospital (environment)')
,('http://snomed.info/sct', '309900005', 'Care of the elderly day hospital (environment)')
,('http://snomed.info/sct', '310206007', 'Private nursing home (environment)')
,('http://snomed.info/sct', '32074000', 'Long term care hospital (environment)')
,('http://snomed.info/sct', '34304006', 'Burn center (environment)')
,('http://snomed.info/sct', '35971002', 'Ambulatory care site (environment)')
,('http://snomed.info/sct', '36125001', 'Trauma center (environment)')
,('http://snomed.info/sct', '38426004', 'Treatment center for emotionally disturbed children (environment)')
,('http://snomed.info/sct', '405607001', 'Ambulatory surgery center (environment)')
,('http://snomed.info/sct', '405608006', 'Academic medical center (environment)')
,('http://snomed.info/sct', '42665001', 'Nursing home (environment)')
,('http://snomed.info/sct', '4322002', 'Military field hospital (environment)')
,('http://snomed.info/sct', '434771000124107', 'Acute care hospital (environment)')
,('http://snomed.info/sct', '440654001', 'Inpatient environment (environment)')
,('http://snomed.info/sct', '443750004', 'Nonacute hospital (environment)')
,('http://snomed.info/sct', '448399001', 'Dental hospital (environment)')
,('http://snomed.info/sct', '448535008', 'Outpatient freestanding dialysis treatment facility (environment)')
,('http://snomed.info/sct', '45131006', 'Primary care hospital (environment)')
,('http://snomed.info/sct', '46111000', 'Secondary care hospital (environment)')
,('http://snomed.info/sct', '48120004', 'Cancer hospital (environment)')
,('http://snomed.info/sct', '48311003', 'Veterans administration hospital (environment)')
,('http://snomed.info/sct', '54372004', 'Geriatric hospital (environment)')
,('http://snomed.info/sct', '56109004', 'Intermediate care hospital (environment)')
,('http://snomed.info/sct', '62480006', 'Psychiatric hospital (environment)')
,('http://snomed.info/sct', '69362002', 'Hospital-based ambulatory surgery facility (environment)')
,('http://snomed.info/sct', '77500004', 'Vocational rehabilitation center (environment)')
,('http://snomed.info/sct', '79993009', 'Government hospital (environment)')
,('http://snomed.info/sct', '80522000', 'Rehabilitation hospital (environment)')
,('http://snomed.info/sct', '82242000', 'Childrens hospital (environment)')
,('http://snomed.info/sct', '10378005', 'Hospital admission, emergency, from emergency room, accidental injury (procedure)')
,('http://snomed.info/sct', '112689000', 'Hospital admission, elective, with complete pre-admission work-up (procedure)')
,('http://snomed.info/sct', '1505002', 'Hospital admission for isolation (procedure)')
,('http://snomed.info/sct', '15584006', 'Hospital admission, elective, with partial pre-admission work-up (procedure)')
,('http://snomed.info/sct', '18083007', 'Hospital admission, emergency, indirect (procedure)')
,('http://snomed.info/sct', '183450002', 'Admission to burn unit (procedure)')
,('http://snomed.info/sct', '183452005', 'Emergency hospital admission (procedure)')
,('http://snomed.info/sct', '183481006', 'Non-urgent hospital admission (procedure)')
,('http://snomed.info/sct', '183487005', 'Non-urgent medical admission (procedure)')
,('http://snomed.info/sct', '183488000', 'Non-urgent surgical admission (procedure)')
,('http://snomed.info/sct', '183489008', 'Non-urgent psychiatric admission (procedure)')
,('http://snomed.info/sct', '183491000', 'Non-urgent geriatric admission (procedure)')
,('http://snomed.info/sct', '183492007', 'Non-urgent pediatric admission (procedure)')
,('http://snomed.info/sct', '183493002', 'Non-urgent gynecological admission (procedure)')
,('http://snomed.info/sct', '183494008', 'Non-urgent obstetric admission (procedure)')
,('http://snomed.info/sct', '183495009', 'Non-urgent orthopedic admission (procedure)')
,('http://snomed.info/sct', '183496005', 'Non-urgent ear, nose and throat admission (procedure)')
,('http://snomed.info/sct', '183497001', 'Non-urgent trauma admission (procedure)')
,('http://snomed.info/sct', '183498006', 'Non-urgent ophthalmological admission (procedure)')
,('http://snomed.info/sct', '183499003', 'Non-urgent rheumatology admission (procedure)')
,('http://snomed.info/sct', '183500007', 'Non-urgent dermatology admission (procedure)')
,('http://snomed.info/sct', '183501006', 'Non-urgent neurology admission (procedure)')
,('http://snomed.info/sct', '183502004', 'Non-urgent urology admission (procedure)')
,('http://snomed.info/sct', '183503009', 'Non-urgent radiotherapy admission (procedure)')
,('http://snomed.info/sct', '183504003', 'Non-urgent hematology admission (procedure)')
,('http://snomed.info/sct', '183505002', 'Non-urgent plastic surgery admission (procedure)')
,('http://snomed.info/sct', '183506001', 'Non-urgent diabetic admission (procedure)')
,('http://snomed.info/sct', '183507005', 'Non-urgent respiratory admission (procedure)')
,('http://snomed.info/sct', '183508000', 'Non-urgent psychogeriatric admission (procedure)')
,('http://snomed.info/sct', '183509008', 'Non-urgent renal medicine admission (procedure)')
,('http://snomed.info/sct', '183510003', 'Non-urgent neurosurgical admission (procedure)')
,('http://snomed.info/sct', '183511004', 'Non-urgent cardiothoracic admission (procedure)')
,('http://snomed.info/sct', '183512006', 'Non-urgent oral surgical admission (procedure)')
,('http://snomed.info/sct', '19951005', 'Hospital admission, emergency, from emergency room, medical nature (procedure)')
,('http://snomed.info/sct', '2252009', 'Hospital admission, urgent, 48 hours (procedure)')
,('http://snomed.info/sct', '235313004', 'Non-emergency appendectomy (procedure)')
,('http://snomed.info/sct', '25986004', 'Hospital admission, under police custody (procedure)')
,('http://snomed.info/sct', '2876009', 'Hospital admission, type unclassified, explain by report (procedure)')
,('http://snomed.info/sct', '287927002', 'Dilatation and curettage: routine (procedure)')
,('http://snomed.info/sct', '304566005', 'Admission for treatment (procedure)')
,('http://snomed.info/sct', '305337004', 'Admission to community hospital (procedure)')
,('http://snomed.info/sct', '305338009', 'Admission to general practice hospital (procedure)')
,('http://snomed.info/sct', '305339001', 'Admission to private hospital (procedure)')
,('http://snomed.info/sct', '305341000', 'Admission to tertiary referral hospital (procedure)')
,('http://snomed.info/sct', '305342007', 'Admission to ward (procedure)')
,('http://snomed.info/sct', '305350003', 'Admission to anesthetic department (procedure)')
,('http://snomed.info/sct', '305354007', 'Admission to medical department (procedure)')
,('http://snomed.info/sct', '305355008', 'Admission to clinical allergy department (procedure)')
,('http://snomed.info/sct', '305356009', 'Admission to audiology department (procedure)')
,('http://snomed.info/sct', '305357000', 'Admission to cardiology department (procedure)')
,('http://snomed.info/sct', '305358005', 'Admission to chest medicine department (procedure)')
,('http://snomed.info/sct', '305359002', 'Admission to thoracic medicine department (procedure)')
,('http://snomed.info/sct', '305360007', 'Admission to pulmonary medicine department (procedure)')
,('http://snomed.info/sct', '305361006', 'Admission to clinical immunology department (procedure)')
,('http://snomed.info/sct', '305362004', 'Admission to clinical neurophysiology department (procedure)')
,('http://snomed.info/sct', '305363009', 'Admission to clinical pharmacology department (procedure)')
,('http://snomed.info/sct', '305364003', 'Admission to clinical physiology department (procedure)')
,('http://snomed.info/sct', '305365002', 'Admission to dermatology department (procedure)')
,('http://snomed.info/sct', '305366001', 'Admission to endocrinology department (procedure)')
,('http://snomed.info/sct', '305367005', 'Admission to gastroenterology department (procedure)')
,('http://snomed.info/sct', '305368000', 'Admission to general medical department (procedure)')
,('http://snomed.info/sct', '305369008', 'Admission to genetics department (procedure)')
,('http://snomed.info/sct', '305370009', 'Admission to clinical genetics department (procedure)')
,('http://snomed.info/sct', '305371008', 'Admission to clinical cytogenetics department (procedure)')
,('http://snomed.info/sct', '305372001', 'Admission to clinical molecular genetics department (procedure)')
,('http://snomed.info/sct', '305374000', 'Admission to genitourinary medicine department (procedure)')
,('http://snomed.info/sct', '305375004', 'Admission to care of the elderly department (procedure)')
,('http://snomed.info/sct', '305376003', 'Admission to infectious diseases department (procedure)')
,('http://snomed.info/sct', '305377007', 'Admission to medical ophthalmology department (procedure)')
,('http://snomed.info/sct', '305378002', 'Admission to nephrology department (procedure)')
,('http://snomed.info/sct', '305379005', 'Admission to neurology department (procedure)')
,('http://snomed.info/sct', '305380008', 'Admission to nuclear medicine department (procedure)')
,('http://snomed.info/sct', '305382000', 'Admission to rehabilitation department (procedure)')
,('http://snomed.info/sct', '305383005', 'Admission to rheumatology department (procedure)')
,('http://snomed.info/sct', '305384004', 'Admission to obstetrics and gynecology department (procedure)')
,('http://snomed.info/sct', '305385003', 'Admission to gynecology department (procedure)')
,('http://snomed.info/sct', '305386002', 'Admission to obstetrics department (procedure)')
,('http://snomed.info/sct', '305387006', 'Admission to pediatric department (procedure)')
,('http://snomed.info/sct', '305388001', 'Admission to special care baby unit (procedure)')
,('http://snomed.info/sct', '305389009', 'Admission to pediatric neurology department (procedure)')
,('http://snomed.info/sct', '305390000', 'Admission to pediatric oncology department (procedure)')
,('http://snomed.info/sct', '305391001', 'Admission to pain management department (procedure)')
,('http://snomed.info/sct', '305392008', 'Admission to pathology department (procedure)')
,('http://snomed.info/sct', '305393003', 'Admission to blood transfusion department (procedure)')
,('http://snomed.info/sct', '305394009', 'Admission to chemical pathology department (procedure)')
,('http://snomed.info/sct', '305395005', 'Admission to general pathology department (procedure)')
,('http://snomed.info/sct', '305396006', 'Admission to hematology department (procedure)')
,('http://snomed.info/sct', '305397002', 'Admission to medical microbiology department (procedure)')
,('http://snomed.info/sct', '305399004', 'Admission to neuropathology department (procedure)')
,('http://snomed.info/sct', '305400006', 'Admission to psychiatry department (procedure)')
,('http://snomed.info/sct', '305401005', 'Admission to child and adolescent psychiatry department (procedure)')
,('http://snomed.info/sct', '305402003', 'Admission to forensic psychiatry department (procedure)')
,('http://snomed.info/sct', '305403008', 'Admission to psychogeriatric department (procedure)')
,('http://snomed.info/sct', '305404002', 'Admission to mental handicap psychiatry department (procedure)')
,('http://snomed.info/sct', '305405001', 'Admission to rehabilitation psychiatry department (procedure)')
,('http://snomed.info/sct', '305406000', 'Admission to radiology department (procedure)')
,('http://snomed.info/sct', '305407009', 'Admission to occupational health department (procedure)')
,('http://snomed.info/sct', '305408004', 'Admission to surgical department (procedure)')
,('http://snomed.info/sct', '305409007', 'Admission to breast surgery department (procedure)')
,('http://snomed.info/sct', '305410002', 'Admission to cardiothoracic surgery department (procedure)')
,('http://snomed.info/sct', '305411003', 'Admission to thoracic surgery department (procedure)')
,('http://snomed.info/sct', '305412005', 'Admission to cardiac surgery department (procedure)')
,('http://snomed.info/sct', '305413000', 'Admission to dental surgery department (procedure)')
,('http://snomed.info/sct', '305414006', 'Admission to orthodontics department (procedure)')
,('http://snomed.info/sct', '305415007', 'Admission to pediatric dentistry department (procedure)')
,('http://snomed.info/sct', '305416008', 'Admission to restorative dentistry department (procedure)')
,('http://snomed.info/sct', '305417004', 'Admission to ear, nose and throat department (procedure)')
,('http://snomed.info/sct', '305418009', 'Admission to endocrine surgery department (procedure)')
,('http://snomed.info/sct', '305419001', 'Admission to gastrointestinal surgery department (procedure)')
,('http://snomed.info/sct', '305420007', 'Admission to general gastrointestinal surgery department (procedure)')
,('http://snomed.info/sct', '305421006', 'Admission to upper gastrointestinal surgery department (procedure)')
,('http://snomed.info/sct', '305422004', 'Admission to colorectal surgery department (procedure)')
,('http://snomed.info/sct', '305423009', 'Admission to general surgical department (procedure)')
,('http://snomed.info/sct', '305424003', 'Admission to hepatobiliary surgical department (procedure)')
,('http://snomed.info/sct', '305425002', 'Admission to neurosurgical department (procedure)')
,('http://snomed.info/sct', '305426001', 'Admission to ophthalmology department (procedure)')
,('http://snomed.info/sct', '305427005', 'Admission to oral surgery department (procedure)')
,('http://snomed.info/sct', '305428000', 'Admission to orthopedic department (procedure)')
,('http://snomed.info/sct', '305429008', 'Admission to pancreatic surgery department (procedure)')
,('http://snomed.info/sct', '305430003', 'Admission to pediatric surgical department (procedure)')
,('http://snomed.info/sct', '305431004', 'Admission to plastic surgery department (procedure)')
,('http://snomed.info/sct', '305432006', 'Admission to surgical transplant department (procedure)')
,('http://snomed.info/sct', '305433001', 'Admission to trauma surgery department (procedure)')
,('http://snomed.info/sct', '305434007', 'Admission to urology department (procedure)')
,('http://snomed.info/sct', '305435008', 'Admission to vascular surgery department (procedure)')
,('http://snomed.info/sct', '306732000', 'Admission to general dental surgery department (procedure)')
,('http://snomed.info/sct', '306803007', 'Admission to stroke unit (procedure)')
,('http://snomed.info/sct', '306967009', 'Admission to hand surgery department (procedure)')
,('http://snomed.info/sct', '308251003', 'Admission to clinical oncology department (procedure)')
,('http://snomed.info/sct', '308252005', 'Admission to radiotherapy department (procedure)')
,('http://snomed.info/sct', '308253000', 'Admission to diabetic department (procedure)')
,('http://snomed.info/sct', '310361003', 'Non-urgent cardiological admission (procedure)')
,('http://snomed.info/sct', '3241000175106', 'Hospital admission from non-health care facility (procedure)')
,('http://snomed.info/sct', '32485007', 'Hospital admission (procedure)')
,('http://snomed.info/sct', '373113001', 'Routine procedure (procedure)')
,('http://snomed.info/sct', '397769005', 'Unexpected admission to high dependency unit (procedure)')
,('http://snomed.info/sct', '398162007', 'Admission to high dependency unit (procedure)')
,('http://snomed.info/sct', '405614004', 'Unexpected hospital admission (procedure)')
,('http://snomed.info/sct', '417005', 'Hospital re-admission (procedure)')
,('http://snomed.info/sct', '432621000124105', 'Hospital admission from dialysis facility (procedure)')
,('http://snomed.info/sct', '442281000124108', 'Emergency hospital admission from observation unit (procedure)')
,('http://snomed.info/sct', '447941000124106', 'Hospital admission of newborn (procedure)')
,('http://snomed.info/sct', '448421000124105', 'Hospital admission, transfer from physician office (procedure)')
,('http://snomed.info/sct', '448431000124108', 'Hospital admission, transfer from assisted living facility (procedure)')
,('http://snomed.info/sct', '448441000124103', 'Hospital admission, transfer from intermediate care facility (procedure)')
,('http://snomed.info/sct', '448851000124103', 'Hospital admission from observation unit (procedure)')
,('http://snomed.info/sct', '4563007', 'Hospital admission, transfer from other hospital or health care facility (procedure)')
,('http://snomed.info/sct', '45702004', 'Hospital admission, precertified by medical audit action (procedure)')
,('http://snomed.info/sct', '47348005', 'Hospital admission, mother, for observation, delivered outside of hospital (procedure)')
,('http://snomed.info/sct', '48183000', 'Hospital admission, special (procedure)')
,('http://snomed.info/sct', '50699000', 'Hospital admission, short-term (procedure)')
,('http://snomed.info/sct', '51032003', 'Hospital admission, donor for transplant organ (procedure)')
,('http://snomed.info/sct', '51501005', 'Hospital admission, parent, for in-hospital child care (procedure)')
,('http://snomed.info/sct', '5161006', 'Specialty clinic admission (procedure)')
,('http://snomed.info/sct', '52748007', 'Hospital admission, involuntary (procedure)')
,('http://snomed.info/sct', '60059000', 'Hospital admission, infant, for observation, delivered outside of hospital (procedure)')
,('http://snomed.info/sct', '63551005', 'Hospital admission, from remote area, by means of special transportation (procedure)')
,('http://snomed.info/sct', '699124006', 'Admission to substance misuse detoxification center (procedure)')
,('http://snomed.info/sct', '70755000', 'Hospital admission, by legal authority (commitment) (procedure)')
,('http://snomed.info/sct', '71290004', 'Hospital admission, limited to designated procedures (procedure)')
,('http://snomed.info/sct', '73607007', 'Hospital admission, emergency, from emergency room (procedure)')
,('http://snomed.info/sct', '74857009', 'Hospital admission, short-term, 24 hours (procedure)')
,('http://snomed.info/sct', '76193006', 'Routinely scheduled operation (procedure)')
,('http://snomed.info/sct', '76464004', 'Hospital admission, for observation (procedure)')
,('http://snomed.info/sct', '78680009', 'Hospital admission, emergency, direct (procedure)')
,('http://snomed.info/sct', '81672003', 'Hospital admission, elective, without pre-admission work-up (procedure)')
,('http://snomed.info/sct', '82942009', 'Hospital admission, blood donor (procedure)')
,('http://snomed.info/sct', '8715000', 'Hospital admission, elective (procedure)')
,('http://www.ama-assn.org/go/cpt', '99304', 'Initial nursing facility care, per day, for the evaluation and management of a patient, which requires these 3 key components: A detailed or comprehensive history. A detailed or comprehensive examination. and Medical decision making that is straightforward or of low complexity. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patients and/or familys needs. Usually, the problem(s) requiring admission are of low severity. Typically, 25 minutes are spent at the bedside and on the patients facility floor or unit.')
,('http://www.ama-assn.org/go/cpt', '99305', 'Initial nursing facility care, per day, for the evaluation and management of a patient, which requires these 3 key components: A comprehensive history. A comprehensive examination. and Medical decision making of moderate complexity. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patients and/or familys needs. Usually, the problem(s) requiring admission are of moderate severity. Typically, 35 minutes are spent at the bedside and on the patients facility floor or unit.')
,('http://www.ama-assn.org/go/cpt', '99306', 'Initial nursing facility care, per day, for the evaluation and management of a patient, which requires these 3 key components: A comprehensive history. A comprehensive examination. and Medical decision making of high complexity. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patients and/or familys needs. Usually, the problem(s) requiring admission are of high severity. Typically, 45 minutes are spent at the bedside and on the patients facility floor or unit.')
,('http://www.ama-assn.org/go/cpt', '99307', 'Subsequent nursing facility care, per day, for the evaluation and management of a patient, which requires at least 2 of these 3 key components: A problem focused interval history. A problem focused examination. Straightforward medical decision making. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patients and/or familys needs. Usually, the patient is stable, recovering, or improving. Typically, 10 minutes are spent at the bedside and on the patients facility floor or unit.')
,('http://www.ama-assn.org/go/cpt', '99308', 'Subsequent nursing facility care, per day, for the evaluation and management of a patient, which requires at least 2 of these 3 key components: An expanded problem focused interval history. An expanded problem focused examination. Medical decision making of low complexity. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patients and/or familys needs. Usually, the patient is responding inadequately to therapy or has developed a minor complication. Typically, 15 minutes are spent at the bedside and on the patients facility floor or unit.')
,('http://www.ama-assn.org/go/cpt', '99309', 'Subsequent nursing facility care, per day, for the evaluation and management of a patient, which requires at least 2 of these 3 key components: A detailed interval history. A detailed examination. Medical decision making of moderate complexity. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patients and/or familys needs. Usually, the patient has developed a significant complication or a significant new problem. Typically, 25 minutes are spent at the bedside and on the patients facility floor or unit.')
,('http://www.ama-assn.org/go/cpt', '99310', 'Subsequent nursing facility care, per day, for the evaluation and management of a patient, which requires at least 2 of these 3 key components: A comprehensive interval history. A comprehensive examination. Medical decision making of high complexity. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patients and/or familys needs. The patient may be unstable or may have developed a significant new problem requiring immediate physician attention. Typically, 35 minutes are spent at the bedside and on the patients facility floor or unit.')
,('http://www.ama-assn.org/go/cpt', '99315', 'Nursing facility discharge day management. 30 minutes or less')
,('http://www.ama-assn.org/go/cpt', '99316', 'Nursing facility discharge day management. more than 30 minutes')
,('http://www.ama-assn.org/go/cpt', '99318', 'Evaluation and management of a patient involving an annual nursing facility assessment, which requires these 3 key components: A detailed interval history. A comprehensive examination. and Medical decision making that is of low to moderate complexity. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patients and/or familys needs. Usually, the patient is stable, recovering, or improving. Typically, 30 minutes are spent at the bedside and on the patients facility floor or unit.')
,('http://www.ama-assn.org/go/cpt', '99324', 'Domiciliary or rest home visit for the evaluation and management of a new patient, which requires these 3 key components: A problem focused history. A problem focused examination. and Straightforward medical decision making. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patients and/or familys needs. Usually, the presenting problem(s) are of low severity. Typically, 20 minutes are spent with the patient and/or family or caregiver.')
,('http://www.ama-assn.org/go/cpt', '99325', 'Domiciliary or rest home visit for the evaluation and management of a new patient, which requires these 3 key components: An expanded problem focused history. An expanded problem focused examination. and Medical decision making of low complexity. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patients and/or familys needs. Usually, the presenting problem(s) are of moderate severity. Typically, 30 minutes are spent with the patient and/or family or caregiver.')
,('http://www.ama-assn.org/go/cpt', '99326', 'Domiciliary or rest home visit for the evaluation and management of a new patient, which requires these 3 key components: A detailed history. A detailed examination. and Medical decision making of moderate complexity. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patients and/or familys needs. Usually, the presenting problem(s) are of moderate to high severity. Typically, 45 minutes are spent with the patient and/or family or caregiver.')
,('http://www.ama-assn.org/go/cpt', '99327', 'Domiciliary or rest home visit for the evaluation and management of a new patient, which requires these 3 key components: A comprehensive history. A comprehensive examination. and Medical decision making of moderate complexity. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patients and/or familys needs. Usually, the presenting problem(s) are of high severity. Typically, 60 minutes are spent with the patient and/or family or caregiver.')
,('http://www.ama-assn.org/go/cpt', '99328', 'Domiciliary or rest home visit for the evaluation and management of a new patient, which requires these 3 key components: A comprehensive history. A comprehensive examination. and Medical decision making of high complexity. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patients and/or familys needs. Usually, the patient is unstable or has developed a significant new problem requiring immediate physician attention. Typically, 75 minutes are spent with the patient and/or family or caregiver.')
,('http://www.ama-assn.org/go/cpt', '99334', 'Domiciliary or rest home visit for the evaluation and management of an established patient, which requires at least 2 of these 3 key components: A problem focused interval history. A problem focused examination. Straightforward medical decision making. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patients and/or familys needs. Usually, the presenting problem(s) are self-limited or minor. Typically, 15 minutes are spent with the patient and/or family or caregiver.')
,('http://www.ama-assn.org/go/cpt', '99335', 'Domiciliary or rest home visit for the evaluation and management of an established patient, which requires at least 2 of these 3 key components: An expanded problem focused interval history. An expanded problem focused examination. Medical decision making of low complexity. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patients and/or familys needs. Usually, the presenting problem(s) are of low to moderate severity. Typically, 25 minutes are spent with the patient and/or family or caregiver.')
,('http://www.ama-assn.org/go/cpt', '99336', 'Domiciliary or rest home visit for the evaluation and management of an established patient, which requires at least 2 of these 3 key components: A detailed interval history. A detailed examination. Medical decision making of moderate complexity. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patients and/or familys needs. Usually, the presenting problem(s) are of moderate to high severity. Typically, 40 minutes are spent with the patient and/or family or caregiver.')
,('http://www.ama-assn.org/go/cpt', '99337', 'Domiciliary or rest home visit for the evaluation and management of an established patient, which requires at least 2 of these 3 key components: A comprehensive interval history. A comprehensive examination. Medical decision making of moderate to high complexity. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patients and/or familys needs. Usually, the presenting problem(s) are of moderate to high severity. The patient may be unstable or may have developed a significant new problem requiring immediate physician attention. Typically, 60 minutes are spent with the patient and/or family or caregiver.')
,('http://snomed.info/sct', '112690009', 'Hospital admission, boarder, for social reasons (procedure)')
,('http://snomed.info/sct', '183430001', 'Holiday relief admission (procedure)')
,('http://snomed.info/sct', '183921001', 'Admission to hospice for respite (procedure)')
,('http://snomed.info/sct', '304567001', 'Admission for long-term care (procedure)')
,('http://snomed.info/sct', '304568006', 'Admission for respite care (procedure)')
,('http://snomed.info/sct', '305336008', 'Admission to hospice (procedure)')
,('http://snomed.info/sct', '305340004', 'Admission to long stay hospital (procedure)')
,('http://snomed.info/sct', '305381007', 'Admission to palliative care department (procedure)')
,('http://snomed.info/sct', '306804001', 'Admission to young disabled unit (procedure)')
,('http://snomed.info/sct', '36723004', 'Hospital admission, pre-nursing home placement (procedure)')
,('http://snomed.info/sct', '449411000124106', 'Admission to skilled nursing facility (procedure)')
,('http://snomed.info/sct', '449421000124103', 'Admission to nursing home (procedure)')
,('http://snomed.info/sct', '449431000124100', 'Admission to inpatient rehabilitation facility (procedure)')
) AS t (system, code, display) ;