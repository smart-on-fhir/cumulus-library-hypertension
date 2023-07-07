CREATE table htn__study_period AS
SELECT DISTINCT
    E.start_date,
    E.start_week,
    E.start_month,
    E.end_date,
    E.age_at_visit,
    P.gender,
    P.race_display,
    P.ethnicity_display,
    E.enc_class_code,
    E.enc_class_display,
    COALESCE(E.enc_type_system, 'None') as enc_type_system,
    COALESCE(E.enc_type_code, 'None')   as enc_type_code,
    COALESCE(E.enc_type_display, 'None')    as enc_type_display,
    COALESCE(E.enc_service_system, 'None')  as enc_service_system,
    COALESCE(E.enc_service_code, 'None')    as enc_service_code,
    COALESCE(E.enc_service_display, 'None') as enc_service_display,
    COALESCE(E.enc_priority_system, 'None') as enc_priority_system,
    COALESCE(E.enc_priority_code, 'None')   as enc_priority_code,
    COALESCE(E.enc_priority_display, 'None') as enc_priority_display,
    P.subject_ref,
    E.encounter_ref
FROM
    core__patient AS P,
    core__encounter_type AS E
WHERE
    (P.subject_ref = E.subject_ref)
    AND (E.start_date BETWEEN date('2016-01-01') AND current_date)
    AND (E.end_date BETWEEN date('2016-01-01') AND current_date)
;