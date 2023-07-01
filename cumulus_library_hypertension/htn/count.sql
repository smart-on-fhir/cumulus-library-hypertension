-- ###########################################################
CREATE or replace VIEW htn__count_bp_eval_month AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        , count(distinct encounter_ref)   as cnt_encounter
        , obs_month, systolic_high, systolic_low, diastolic_high, diastolic_low        
        FROM htn__bp_eval
        group by CUBE
        ( obs_month, systolic_high, systolic_low, diastolic_high, diastolic_low )
    )
    select
          cnt_encounter  as cnt 
        , obs_month, systolic_high, systolic_low, diastolic_high, diastolic_low
    from powerset 
    WHERE cnt_subject >= 10 
    ORDER BY cnt desc;
