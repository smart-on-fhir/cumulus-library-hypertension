-- ###########################################################
CREATE or replace VIEW htn__count_bp_month AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        
        , obs_month, enc_class_code, gender, age_at_visit, race_display, ethnicity_display, hypertension, hypotension        
        FROM htn__bp
        group by CUBE
        ( obs_month, enc_class_code, gender, age_at_visit, race_display, ethnicity_display, hypertension, hypotension )
    )
    select
          cnt_subject as cnt 
        , obs_month, enc_class_code, gender, age_at_visit, race_display, ethnicity_display, hypertension, hypotension
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

-- ###########################################################
CREATE or replace VIEW htn__count_rx_month AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        
        , authoredon_month, category_code, rx_display        
        FROM htn__rx
        group by CUBE
        ( authoredon_month, category_code, rx_display )
    )
    select
          cnt_subject as cnt 
        , authoredon_month, category_code, rx_display
    from powerset 
    WHERE cnt_subject >= 10 
    ORDER BY cnt desc;
