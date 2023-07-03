-- ###########################################################
CREATE or replace VIEW htn__count_bp_month AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        
        , obs_month, enc_class_code, gender, age_at_visit, hypertension, hypotension        
        FROM htn__bp
        group by CUBE
        ( obs_month, enc_class_code, gender, age_at_visit, hypertension, hypotension )
    )
    select
          cnt_subject as cnt 
        , obs_month, enc_class_code, gender, age_at_visit, hypertension, hypotension
    from powerset 
    WHERE cnt_subject >= 10 
    ORDER BY cnt desc;
