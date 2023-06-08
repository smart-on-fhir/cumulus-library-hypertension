drop table if exists htn__dx;

create table htn__dx as
SELECT DISTINCT
    c.subject_ref,
    c.encounter_ref,
    dx.code AS cond_code,
    dx.display as cond_display,
    concat(dx.code, ':', dx.display) as cond_code_display,
    c.recorded_month AS cond_month,
    c.recorded_week AS cond_week,
    s.enc_class_code,
    s.age_at_visit,
    s.gender
FROM core__condition AS c,
    core__study_period AS s,
    htn__define_dx AS dx
WHERE
    c.cond_code.coding[1].code = dx.code
    AND c.encounter_ref = s.encounter_ref;

create or replace view htn__count_dx as
with powerset as (
    select count(distinct encounter_ref) as cnt_encounter,
        cond_code_display,
        enc_class_code,
        gender,
        age_at_visit
    from htn__dx
    group by cube(
        cond_code_display,
        enc_class_code,
        gender,
        age_at_visit)
)
select
    cnt_encounter as cnt,
    cond_code_display,
    enc_class_code,
    gender,
    age_at_visit
from powerset
where cnt_encounter >= 10
order by cnt_encounter desc;

