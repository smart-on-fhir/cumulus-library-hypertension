CREATE table htn__study_period AS
SELECT DISTINCT
    e.start_date,
    e.start_week,
    e.start_month,
    e.end_date,
    e.age_at_visit,
    e.status,
    p.gender,
    p.race_display,
    p.ethnicity_display,
    e.enc_class_code,
    e.enc_class_display,
    COALESCE(e.enc_type_system, 'None') as enc_type_system,
    COALESCE(e.enc_type_code, 'None')   as enc_type_code,
    COALESCE(e.enc_type_display, 'None')    as enc_type_display,
    COALESCE(e.enc_service_system, 'None')  as enc_service_system,
    COALESCE(e.enc_service_code, 'None')    as enc_service_code,
    COALESCE(e.enc_service_display, 'None') as enc_service_display,
    COALESCE(e.enc_priority_system, 'None') as enc_priority_system,
    COALESCE(e.enc_priority_code, 'None')   as enc_priority_code,
    COALESCE(e.enc_priority_display, 'None') as enc_priority_display,
    p.subject_ref,
    e.encounter_ref
FROM
    core__patient AS p,
    core__encounter_type AS e
WHERE
    (p.subject_ref = e.subject_ref)
    AND (e.start_date BETWEEN date('2016-01-01') AND current_date)
    AND (e.end_date BETWEEN date('2016-01-01') AND current_date)
;