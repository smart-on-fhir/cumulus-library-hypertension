-- ###########################################################################
-- Hypertension diagnosis
--
-- htn__dx = *without* Encounter
-- htn__dx_period = *with* Encounter (age_at_visit,class,type,service)
--
-- ###########################################################################

create table htn__dx as
SELECT DISTINCT
    c.subject_ref,
    c.encounter_ref,
    c.category_display,
    dx.code AS cond_code,
    dx.display as cond_display,
    fhirspec.uri as cond_system,
    fhirspec.code_system as cond_system_display,
    c.recordedDate_month AS cond_month,
    c.recordedDate_week AS cond_week,
    c.recordedDate as cond_date
FROM
    htn__define_dx AS dx,
    core__fhir_mapping_code_system_uri as fhirspec,
    core__condition AS c
WHERE
    dx.code = c.code           and
    dx.system = c.code_system  and
    dx.system = fhirspec.uri;


create table htn__dx_period as
SELECT DISTINCT
    c.subject_ref,
    c.encounter_ref,
    c.category_display,
    dx.code AS cond_code,
    dx.display as cond_display,
    fhirspec.uri as cond_system,
    fhirspec.code_system as cond_system_display,
    c.recordedDate as cond_date,
    c.recordedDate_month AS cond_month,
    c.recordedDate_week AS cond_week,
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
    core__fhir_mapping_code_system_uri as fhirspec,
    core__condition AS c
WHERE
    dx.code = c.code           and
    dx.system = c.code_system  and
    dx.system = fhirspec.uri    and
    c.encounter_ref = s.encounter_ref;