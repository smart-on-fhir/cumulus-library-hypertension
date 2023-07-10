-- ############################################################################
-- HTN Comorbidity
-- FHIR Condition match on subject
--

CREATE TABLE htn__comorbidity as
WITH condition_row AS
(
    SELECT DISTINCT
        c.subject_ref,
        c.encounter_ref,
        c.category.display as comorbidity_category_display,
        cc.code AS comorbidity_code,
        cc.display as comorbidity_display,
        fhirspec.define as comorbidity_system_display,
        c.recorded_month AS comorbidity_month,
        c.recorded_week AS comorbidity_week,
        c.recordeddate as comorbidity_date
    FROM
        core__condition_codable_concepts cc,
        core__condition AS c,
        core__fhir_define as fhirspec
    WHERE
        cc.id = c.condition_id          and
        cc.code_system = fhirspec.url   and
        cc.code not in (select distinct code from htn__define_dx)
)
select distinct
        condition_row.*,
        core__patient.gender,
        core__patient.race_display,
        core__patient.ethnicity_display
from    htn__dx, core__patient, condition_row
where   htn__dx.subject_ref = core__patient.subject_ref
and     htn__dx.subject_ref = condition_row.subject_ref
;

-- FHIR Condition match on encounter
CREATE TABLE htn__comorbidity_period as
select distinct
        C.comorbidity_category_display,
        C.comorbidity_code,
        C.comorbidity_display,
        C.comorbidity_system_display,
        P.*
from    htn__prevalence as P,
        htn__comorbidity as C
where   P.encounter_ref = C.encounter_ref
and     P.hypertension  = 'Hypertension'
;