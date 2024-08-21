-- FHIR Definition Standard Profile
-- http://hl7.org/fhir/us/vitals/StructureDefinition/blood-pressure-panel
--
--85354-9	Blood pressure panel
-- 8480-6	Systolic blood pressure
-- 8462-4	Diastolic blood pressure
-- #########################################################################
-- Notice: Vital Signs are the *most common measurement* in clinical practice.
-- One patient can easily have >50 blood pressure readings.
-- creating these tables on large datasets could SQL timeout.
-- Therefore we process this table in steps
-- 1) Create table for the BP Panel
-- 2) Create table for each BP Panel Component, "systolic" and "diastolic"
-- 3) Create table to evaluate the results "high/low" blood pressure
-- 4) Create table to join encounter and demographics data

-- #########################################################################
-- 1) Create table for the BP Panel

create table htn__bp_panel as WITH
define_panel as
    (select * from htn__define_bp where component='panel'),
define_component as
    (select * from htn__define_bp where component!='panel')
select distinct
    define_component.*,
    OCC.code as component_code,
    OCVQ.value as mmHg,
    O.effectiveDateTime_day as obs_date,
    O.effectiveDateTime_week as obs_week,
    O.effectiveDateTime_month as obs_month,
    O.effectiveDateTime_year as obs_year,
    status,
    O.observation_ref,
    O.encounter_ref,
    O.subject_ref
from    define_panel,
        define_component,
        core__observation_vital_signs as O,
        core__observation_component_code as OCC,
        core__observation_component_valuequantity as OCVQ
where   define_panel.code = O.observation_code
and     define_panel.system = O.observation_system
and     define_component.code = OCC.code
and     define_component.system = OCC.system
and     O.id = OCC.id
and     O.id = OCVQ.id
and     OCC.row = OCVQ.row
;

-- #########################################################################
-- 2) Create table for each BP Panel Component, "systolic" and "diastolic"

-- SYSTOLIC blood pressure is the numerator "141" in a reading 141/89
create table htn__bp_systolic as
select * from htn__bp_panel where component = 'systolic';

-- DIASTOLIC blood pressure is the denom "89" in a reading 141/89
create table htn__bp_diastolic as
select * from htn__bp_panel where component = 'diastolic';

-- #########################################################################
-- 3) Create table to evaluate the results "high/low" blood pressure

create table htn__bp_eval as
select
    concat(
        cast(systolic.mmHg as varchar),
        '/',
        cast(diastolic.mmHg as varchar)) as bp_display,
    systolic.mmHg as systolic_mmHg,
    case when (systolic.mmHg >= 140) then True else False end as systolic_high,
    case when (systolic.mmHg < 90) then True else False end as systolic_low,
    diastolic.mmHg as diastolic_mmHg,
    case when (diastolic.mmHg >= 90) then True else False end as diastolic_high,
    case when (diastolic.mmHg < 60) then True else False end as diastolic_low,
    case when ((systolic.mmHg >= 140) or (diastolic.mmHg >= 90)) then True else False end as hypertension,
    case when ((systolic.mmHg < 90) or (diastolic.mmHg < 60)) then True else False end as hypotension,
    systolic.obs_date,
    systolic.obs_week,
    systolic.obs_month,
    systolic.obs_year,
    systolic.subject_ref,
    systolic.encounter_ref,
    systolic.observation_ref
from
    htn__bp_systolic as systolic,
    htn__bp_diastolic as diastolic
where
    systolic.observation_ref = diastolic.observation_ref
;

-- #########################################################################
-- 4) Create table to join encounter and demographics data

create table htn__bp as
select distinct
    BP.bp_display,
    BP.hypertension,
    BP.hypotension,
    BP.systolic_high,
    BP.systolic_low,
    BP.diastolic_high,
    BP.diastolic_low,
    BP.obs_date,
    BP.obs_week,
    BP.obs_month,
    BP.subject_ref,
    BP.encounter_ref,
    BP.observation_ref,
    S.enc_class_code,
    S.enc_class_display,
    S.enc_type_display,
    S.age_at_visit,
    S.gender,
    S.race_display,
    S.ethnicity_display
from    htn__bp_eval BP,
        htn__study_period as S
where   BP.encounter_ref = S.encounter_ref
order by BP.subject_ref, BP.encounter_ref
;