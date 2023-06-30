-- htn__bp: **all** Blood Pressure, even if there is no matching LOINC code

create table htn__bp as
with readings as
(
    select distinct status,
        measure.valueQuantity,
        measure.valueQuantity.value as mmHg,
        measure_code,
        measure.interpretation,
        O.observation_ref,
        O.encounter_ref,
        O.subject_ref,
        O.obs_week,
        O.obs_month,
        O.obs_year,
        S.enc_class_code,
        S.age_at_visit,
        S.gender,
        S.race_display
    from core__observation_vital_signs as O
        ,core__study_period S
        ,UNNEST(component) t (measure)
        ,UNNEST(measure.code.coding) t (measure_code)
    where   measure.valueQuantity.system ='http://unitsofmeasure.org'
    and     measure.valueQuantity.unit ='mmHg'
    and     O.encounter_ref = S.encounter_ref
),
def_systolic as (select * from htn__define_bp_systolic),
def_diastolic as (select * from htn__define_bp_diastolic)
select distinct
    case when def_systolic.code is not null then True else False end as systolic,
    case when def_diastolic.code is not null then True else False end as diastolic,
    R.*
from readings R
left join def_systolic  on def_systolic.code = measure_code.code
left join def_diastolic on def_diastolic.code = measure_code.code
;

-- htn__bp_eval: **eval** Blood Pressure for systolic/diastolic LOINC codes

create table htn__bp_eval as
select
    enc_class_code,
    mmHg,
    systolic,
    case when (systolic and mmHg < 90) then True else False end as systolic_low,
    case when (systolic and mmHg >= 140) then True else False end as systolic_high,
    diastolic,
    case when (diastolic and mmHg < 60) then True else False end as diastolic_low,
    case when (diastolic and mmHg >= 90) then True else False end as diastolic_high,
    status,
    obs_week,
    obs_month,
    obs_year,
    age_at_visit,
    gender,
    race_display,
    subject_ref,
    encounter_ref,
    observation_ref
from htn__bp
where systolic or diastolic
order by systolic, diastolic, obs_week
;