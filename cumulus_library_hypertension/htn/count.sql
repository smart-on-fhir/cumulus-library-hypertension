-- ###########################################################
CREATE or replace VIEW htn__count_bp AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        
        , hypertension, hypotension, enc_class_code, gender, age_at_visit, race_display, ethnicity_display        
        FROM htn__bp
        group by CUBE
        ( hypertension, hypotension, enc_class_code, gender, age_at_visit, race_display, ethnicity_display )
    )
    select
          cnt_subject as cnt 
        , hypertension, hypotension, enc_class_code, gender, age_at_visit, race_display, ethnicity_display
    from powerset 
    WHERE cnt_subject >= 10 
    ORDER BY cnt desc;

-- ###########################################################
CREATE or replace VIEW htn__count_bp_month AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        
        , hypertension, hypotension, enc_class_code, gender, age_at_visit, race_display, ethnicity_display, obs_month        
        FROM htn__bp
        group by CUBE
        ( hypertension, hypotension, enc_class_code, gender, age_at_visit, race_display, ethnicity_display, obs_month )
    )
    select
          cnt_subject as cnt 
        , hypertension, hypotension, enc_class_code, gender, age_at_visit, race_display, ethnicity_display, obs_month
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

---- ###########################################################
--CREATE or replace VIEW htn__count_rx_month AS
--    with powerset as
--    (
--        select
--        count(distinct subject_ref)   as cnt_subject
--
--        , category_code, rx_display, authoredon_month
--        FROM htn__rx
--        group by CUBE
--        ( category_code, rx_display, authoredon_month )
--    )
--    select
--          cnt_subject as cnt
--        , category_code, rx_display, authoredon_month
--    from powerset
--    WHERE cnt_subject >= 10
--    ORDER BY cnt desc;

-- ###########################################################
--CREATE or replace VIEW htn__count_procedure AS
--    with powerset as
--    (
--        select
--        count(distinct subject_ref)   as cnt_subject
--        , count(distinct encounter_ref)   as cnt_encounter
--        , enc_class_display, proc_display, proc_system
--        FROM htn__procedure
--        group by CUBE
--        ( enc_class_display, proc_display, proc_system )
--    )
--    select
--          cnt_encounter  as cnt
--        , enc_class_display, proc_display, proc_system
--    from powerset
--    WHERE cnt_subject >= 10
--    ORDER BY cnt desc;

-- ###########################################################
--CREATE or replace VIEW htn__count_procedure_month AS
--    with powerset as
--    (
--        select
--        count(distinct subject_ref)   as cnt_subject
--        , count(distinct encounter_ref)   as cnt_encounter
--        , enc_class_display, proc_display, proc_system, enc_start_month
--        FROM htn__procedure
--        group by CUBE
--        ( enc_class_display, proc_display, proc_system, enc_start_month )
--    )
--    select
--          cnt_encounter  as cnt
--        , enc_class_display, proc_display, proc_system, enc_start_month
--    from powerset
--    WHERE cnt_subject >= 10
--    ORDER BY cnt desc;
