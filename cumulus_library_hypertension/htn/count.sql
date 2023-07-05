-- ###########################################################
CREATE or replace VIEW htn__count_bp AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        
        , hypertension, hypotension, enc_class_code, gender, age_at_visit, race_display, ethnicity_display, hypertension, hypotension        
        FROM htn__bp
        group by CUBE
        ( hypertension, hypotension, enc_class_code, gender, age_at_visit, race_display, ethnicity_display, hypertension, hypotension )
    )
    select
          cnt_subject as cnt 
        , hypertension, hypotension, enc_class_code, gender, age_at_visit, race_display, ethnicity_display, hypertension, hypotension
    from powerset 
    WHERE cnt_subject >= 10 
    ORDER BY cnt desc;

-- ###########################################################
CREATE or replace VIEW htn__count_bp_month AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        
        , hypertension, hypotension, enc_class_code, gender, age_at_visit, race_display, ethnicity_display, hypertension, hypotension, obs_month        
        FROM htn__bp
        group by CUBE
        ( hypertension, hypotension, enc_class_code, gender, age_at_visit, race_display, ethnicity_display, hypertension, hypotension, obs_month )
    )
    select
          cnt_subject as cnt 
        , hypertension, hypotension, enc_class_code, gender, age_at_visit, race_display, ethnicity_display, hypertension, hypotension, obs_month
    from powerset 
    WHERE cnt_subject >= 10 
    ORDER BY cnt desc;

-- ###########################################################
CREATE or replace VIEW htn__count_dx_month AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        
        , cond_month, enc_class_code, gender, age_at_visit, race_display, ethnicity_display, cond_display, cond_system_display        
        FROM htn__dx
        group by CUBE
        ( cond_month, enc_class_code, gender, age_at_visit, race_display, ethnicity_display, cond_display, cond_system_display )
    )
    select
          cnt_subject as cnt 
        , cond_month, enc_class_code, gender, age_at_visit, race_display, ethnicity_display, cond_display, cond_system_display
    from powerset 
    WHERE cnt_subject >= 10 
    ORDER BY cnt desc;
