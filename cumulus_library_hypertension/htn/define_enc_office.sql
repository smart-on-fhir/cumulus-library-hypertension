create or replace view htn__define_enc_office as select * from (values
('http://www.ama-assn.org/go/cpt', '99201', 'Office or other outpatient visit for the evaluation and management of a new patient, which requires these 3 key components: A problem focused history. A problem focused examination. Straightforward medical decision making. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patients and/or familys needs. Usually, the presenting problem(s) are self limited or minor. Typically, 10 minutes are spent face-to-face with the patient and/or family.')
,('http://www.ama-assn.org/go/cpt', '99202', 'Office or other outpatient visit for the evaluation and management of a new patient, which requires these 3 key components: An expanded problem focused history. An expanded problem focused examination. Straightforward medical decision making. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patients and/or familys needs. Usually, the presenting problem(s) are of low to moderate severity. Typically, 20 minutes are spent face-to-face with the patient and/or family.')
,('http://www.ama-assn.org/go/cpt', '99203', 'Office or other outpatient visit for the evaluation and management of a new patient, which requires these 3 key components: A detailed history. A detailed examination. Medical decision making of low complexity. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patients and/or familys needs. Usually, the presenting problem(s) are of moderate severity. Typically, 30 minutes are spent face-to-face with the patient and/or family.')
,('http://www.ama-assn.org/go/cpt', '99204', 'Office or other outpatient visit for the evaluation and management of a new patient, which requires these 3 key components: A comprehensive history. A comprehensive examination. Medical decision making of moderate complexity. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patients and/or familys needs. Usually, the presenting problem(s) are of moderate to high severity. Typically, 45 minutes are spent face-to-face with the patient and/or family.')
,('http://www.ama-assn.org/go/cpt', '99205', 'Office or other outpatient visit for the evaluation and management of a new patient, which requires these 3 key components: A comprehensive history. A comprehensive examination. Medical decision making of high complexity. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patients and/or familys needs. Usually, the presenting problem(s) are of moderate to high severity. Typically, 60 minutes are spent face-to-face with the patient and/or family.')
,('http://www.ama-assn.org/go/cpt', '99212', 'Office or other outpatient visit for the evaluation and management of an established patient, which requires at least 2 of these 3 key components: A problem focused history. A problem focused examination. Straightforward medical decision making. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patients and/or familys needs. Usually, the presenting problem(s) are self limited or minor. Typically, 10 minutes are spent face-to-face with the patient and/or family.')
,('http://www.ama-assn.org/go/cpt', '99213', 'Office or other outpatient visit for the evaluation and management of an established patient, which requires at least 2 of these 3 key components: An expanded problem focused history. An expanded problem focused examination. Medical decision making of low complexity. Counseling and coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patients and/or familys needs. Usually, the presenting problem(s) are of low to moderate severity. Typically, 15 minutes are spent face-to-face with the patient and/or family.')
,('http://www.ama-assn.org/go/cpt', '99214', 'Office or other outpatient visit for the evaluation and management of an established patient, which requires at least 2 of these 3 key components: A detailed history. A detailed examination. Medical decision making of moderate complexity. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patients and/or familys needs. Usually, the presenting problem(s) are of moderate to high severity. Typically, 25 minutes are spent face-to-face with the patient and/or family.')
,('http://www.ama-assn.org/go/cpt', '99215', 'Office or other outpatient visit for the evaluation and management of an established patient, which requires at least 2 of these 3 key components: A comprehensive history. A comprehensive examination. Medical decision making of high complexity. Counseling and/or coordination of care with other physicians, other qualified health care professionals, or agencies are provided consistent with the nature of the problem(s) and the patients and/or familys needs. Usually, the presenting problem(s) are of moderate to high severity. Typically, 40 minutes are spent face-to-face with the patient and/or family.')
) AS t (system, code, display) ;