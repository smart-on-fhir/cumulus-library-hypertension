drop table if exists htn__dx;

create table htn__dx as
SELECT DISTINCT
    c.subject_ref,
    c.encounter_ref,
    dx.code AS cond_code,
    dx.display as cond_display,
    fhirspec.url as cond_system,
    fhirspec.define as cond_system_display,
    c.recordeddate as cond_date,
    c.recorded_month AS cond_month,
    c.recorded_week AS cond_week,
    s.enc_class_code,
    s.enc_class_display,
    s.enc_type_display,
    s.age_at_visit,
    s.gender,
    s.race_display,
    s.ethnicity_display
FROM
    htn__define_dx AS dx,
    htn__study_period AS s,
    core__fhir_define as fhirspec,
    core__condition_codable_concepts cc,
    core__condition AS c
WHERE
    dx.code = cc.code           and
    dx.system = cc.code_system  and
    dx.system = fhirspec.url    and
    cc.id = c.condition_id      and
    c.encounter_ref = s.encounter_ref;