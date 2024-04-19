CREATE table htn__study_period AS
SELECT DISTINCT
    e.period_start_day as start_date,
    e.period_start_week as start_week,
    e.period_start_month as start_month,
    e.period_end_day as end_date,
    e.age_at_visit,
    e.status,
    p.gender,
    p.race_display,
    p.ethnicity_display,
    e.class_code AS enc_class_code,
    e.class_display AS enc_class_display,
    COALESCE(e.type_code_system, 'None') as enc_type_system,
    COALESCE(e.type_code, 'None')        as enc_type_code,
    COALESCE(e.type_display, 'None')     as enc_type_display,
    COALESCE(e.serviceType_code_system, 'None') as enc_service_system,
    COALESCE(e.serviceType_code, 'None')        as enc_service_code,
    COALESCE(e.serviceType_display, 'None')     as enc_service_display,
    COALESCE(e.priority_code_system, 'None') as enc_priority_system,
    COALESCE(e.priority_code, 'None')        as enc_priority_code,
    COALESCE(e.priority_display, 'None')     as enc_priority_display,
    p.subject_ref,
    e.encounter_ref
FROM
    core__patient AS p,
    core__encounter AS e
WHERE
    (p.subject_ref = e.subject_ref)
    AND (e.period_start_day BETWEEN date('2016-01-01') AND current_date)
    AND (e.period_end_day BETWEEN date('2016-01-01') AND current_date)
;