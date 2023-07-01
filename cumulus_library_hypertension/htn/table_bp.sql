-- htn__bp: **all** Blood Pressure values, even if there is no matching code

--create table htn__bp_any as
--select distinct status,
--    measure.valueQuantity,
--    measure.valueQuantity.value as mmHg,
--    measure_code,
--    measure.interpretation,
--    O.observation_ref,
--    O.encounter_ref,
--    O.subject_ref,
--    O.obs_date,
--    O.obs_week,
--    O.obs_month,
--    O.obs_year,
--    S.enc_class_code,
--    S.age_at_visit,
--    S.gender,
--    S.race_display
--from core__observation_vital_signs as O
--    ,core__study_period S
--    ,UNNEST(component) t (measure)
--    ,UNNEST(measure.code.coding) t (measure_code)
--where   measure.valueQuantity.system ='http://unitsofmeasure.org'
--and     measure.valueQuantity.unit ='mmHg'
--and     O.encounter_ref = S.encounter_ref;

create table htn__bp_any as
select distinct status,
    measure.valueQuantity,
    measure.valueQuantity.value as mmHg,
    measure_code,
    measure.interpretation,
    O.observation_ref,
    O.encounter_ref,
    O.subject_ref,
    O.obs_date,
    O.obs_week,
    O.obs_month,
    O.obs_year
from core__observation_vital_signs as O
    ,UNNEST(component) t (measure)
    ,UNNEST(measure.code.coding) t (measure_code)
where   measure.valueQuantity.system ='http://unitsofmeasure.org'
and     measure.valueQuantity.unit ='mmHg';

--create table htn__bp_panel as WITH
--define_panel as
--    (select * from htn__define_bp where component='panel'),
--define_component as
--    (select * from htn__define_bp where component!='panel')
--select distinct
--    define_component.*,
--    component_code,
--    component_part.valueQuantity,
--    component_part.valueQuantity.value as mmHg,
--    O.obs_date,
--    O.obs_week,
--    O.obs_month,
--    O.obs_year,
--    S.enc_class_code,
--    S.age_at_visit,
--    S.gender,
--    S.race_display,
--    status,
--    O.observation_ref,
--    O.encounter_ref,
--    O.subject_ref
--from    define_panel,
--        define_component,
--        core__study_period as S,
--        core__observation_vital_signs as O,
--        UNNEST(O.component) t (component_part),
--        UNNEST(component_part.code.coding) t (component_code)
--where   define_panel.code = O.obs_code.code
--and     define_component.code = component_code.code
--;

create table htn__bp_panel as WITH
define_panel as
    (select * from htn__define_bp where component='panel'),
define_component as
    (select * from htn__define_bp where component!='panel')
select distinct
    define_component.*,
    component_code,
    component_part.valueQuantity,
    component_part.valueQuantity.value as mmHg,
    O.obs_date,
    O.obs_week,
    O.obs_month,
    O.obs_year,
    status,
    O.observation_ref,
    O.encounter_ref,
    O.subject_ref
from    define_panel,
        define_component,
        core__observation_vital_signs as O,
        UNNEST(O.component) t (component_part),
        UNNEST(component_part.code.coding) t (component_code)
where   define_panel.code = O.obs_code.code
and     define_component.code = component_code.code
;

-- SYSTOLIC blood pressure is the numerator "141" in a reading 141/89
create table htn__bp_systolic as
select * from htn__bp_panel where component = 'systolic';

-- DIASTOLIC blood pressure is the denom "89" in a reading 141/89
create table htn__bp_diastolic as
select * from htn__bp_panel where component = 'diastolic';

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
    systolic.encounter_ref = diastolic.encounter_ref
;

create table htn__bp as
select distinct
    BP.systolic_high,
    BP.systolic_low,
    BP.diastolic_high,
    BP.diastolic_low,
    BP.obs_week,
    BP.obs_month,
    BP.subject_ref,
    BP.encounter_ref,
    BP.observation_ref,
    S.enc_class_code,
    S.age_at_visit,
    S.gender,
    S.race_display
from    htn__bp_eval BP,
        core__study_period as S
where   BP.encounter_ref = S.encounter_ref
;