drop table if exists htn__bp;

create or replace view htn__bp as
with readings as
(
    select distinct status,
        measure.valueQuantity,
        measure_code,
        measure.interpretation,
        VS.observation_ref,
        VS.encounter_ref,
        VS.subject_ref,
        P.enc_class_code
    from core__observation_vital_signs VS
        ,core__study_period P
        ,UNNEST(component) t (measure)
        ,UNNEST(measure.code.coding) t (measure_code)
    where   measure.valueQuantity.system ='http://unitsofmeasure.org'
    and     measure.valueQuantity.unit ='mmHg'
    and     VS.encounter_ref = P.encounter_ref
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