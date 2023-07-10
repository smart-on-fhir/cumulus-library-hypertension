create TABLE htn__prevalence as
select distinct
    CASE    WHEN htn__bp.hypertension or (htn__dx.cond_code IS NOT NULL)
            THEN 'Hypertension' ELSE 'None' END as hypertension,

    CASE    WHEN htn__bp.hypertension
            THEN 'Hypertension' ELSE 'None' END as hypertension_lab,

    CASE    WHEN htn__dx.cond_code IS NOT NULL
            THEN 'Hypertension' ELSE 'None' END as hypertension_dx,

    COALESCE(htn__dx.category_display, 'None') as cond_category_display,
    COALESCE(htn__dx.cond_code, 'None') as cond_code,
    COALESCE(htn__dx.cond_display, 'None') as cond_display,
    htn__study_period.*
from
    htn__study_period as htn__study_period
left join htn__dx on htn__study_period.encounter_ref = htn__dx.encounter_ref
left join htn__bp on htn__study_period.encounter_ref = htn__bp.encounter_ref
;
