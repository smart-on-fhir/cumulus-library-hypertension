-- ###########################################################
CREATE or replace VIEW htn__count_bp_eval_month AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        , count(distinct encounter_ref)   as cnt_encounter
        , obs_month, enc_class_code, gender, age_at_visit, systolic, systolic_low, systolic_high, diastolic, diastolic_low, diastolic_high        
        FROM htn__bp_eval
        group by CUBE
        ( obs_month, enc_class_code, gender, age_at_visit, systolic, systolic_low, systolic_high, diastolic, diastolic_low, diastolic_high )
    )
    select
          cnt_encounter  as cnt 
        , obs_month, enc_class_code, gender, age_at_visit, systolic, systolic_low, systolic_high, diastolic, diastolic_low, diastolic_high
    from powerset 
    WHERE cnt_subject >= 10 
    ORDER BY cnt desc;
