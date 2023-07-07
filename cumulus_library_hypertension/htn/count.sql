-- ###########################################################
CREATE TABLE htn__count_study_period_month AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        , count(distinct encounter_ref)   as cnt_encounter
        , start_month, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display        
        FROM htn__study_period
        group by CUBE
        ( start_month, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display )
    )
    select
          cnt_encounter  as cnt 
        , start_month, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display
    from powerset 
    WHERE cnt_subject >= 10 
    ;

-- ###########################################################
CREATE TABLE htn__count_study_period_week AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        , count(distinct encounter_ref)   as cnt_encounter
        , start_week, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display        
        FROM htn__study_period
        group by CUBE
        ( start_week, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display )
    )
    select
          cnt_encounter  as cnt 
        , start_week, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display
    from powerset 
    WHERE cnt_subject >= 10 
    ;

-- ###########################################################
CREATE TABLE htn__count_study_period_date AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        , count(distinct encounter_ref)   as cnt_encounter
        , start_date, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display        
        FROM htn__study_period
        group by CUBE
        ( start_date, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display )
    )
    select
          cnt_encounter  as cnt 
        , start_date, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display
    from powerset 
    WHERE cnt_subject >= 10 
    ;

-- ###########################################################
CREATE TABLE htn__count_bp AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        
        , hypertension, hypotension, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display        
        FROM htn__bp
        group by CUBE
        ( hypertension, hypotension, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display )
    )
    select
          cnt_subject as cnt 
        , hypertension, hypotension, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display
    from powerset 
    WHERE cnt_subject >= 10 
    ;

-- ###########################################################
CREATE TABLE htn__count_bp_month AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        
        , hypertension, hypotension, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display, obs_month        
        FROM htn__bp
        group by CUBE
        ( hypertension, hypotension, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display, obs_month )
    )
    select
          cnt_subject as cnt 
        , hypertension, hypotension, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display, obs_month
    from powerset 
    WHERE cnt_subject >= 10 
    ;

-- ###########################################################
CREATE TABLE htn__count_bp_week AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        
        , hypertension, hypotension, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display, obs_week        
        FROM htn__bp
        group by CUBE
        ( hypertension, hypotension, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display, obs_week )
    )
    select
          cnt_subject as cnt 
        , hypertension, hypotension, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display, obs_week
    from powerset 
    WHERE cnt_subject >= 10 
    ;

-- ###########################################################
CREATE TABLE htn__count_bp_date AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        
        , hypertension, hypotension, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display, obs_date        
        FROM htn__bp
        group by CUBE
        ( hypertension, hypotension, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display, obs_date )
    )
    select
          cnt_subject as cnt 
        , hypertension, hypotension, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display, obs_date
    from powerset 
    WHERE cnt_subject >= 10 
    ;

-- ###########################################################
CREATE TABLE htn__count_dx_month AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        
        , category_display, cond_display, cond_system_display, cond_month        
        FROM htn__dx
        group by CUBE
        ( category_display, cond_display, cond_system_display, cond_month )
    )
    select
          cnt_subject as cnt 
        , category_display, cond_display, cond_system_display, cond_month
    from powerset 
    WHERE cnt_subject >= 10 
    ;

-- ###########################################################
CREATE TABLE htn__count_dx_week AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        
        , category_display, cond_display, cond_system_display, cond_week        
        FROM htn__dx
        group by CUBE
        ( category_display, cond_display, cond_system_display, cond_week )
    )
    select
          cnt_subject as cnt 
        , category_display, cond_display, cond_system_display, cond_week
    from powerset 
    WHERE cnt_subject >= 10 
    ;

-- ###########################################################
CREATE TABLE htn__count_dx_date AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        
        , category_display, cond_display, cond_system_display, cond_date        
        FROM htn__dx
        group by CUBE
        ( category_display, cond_display, cond_system_display, cond_date )
    )
    select
          cnt_subject as cnt 
        , category_display, cond_display, cond_system_display, cond_date
    from powerset 
    WHERE cnt_subject >= 10 
    ;

-- ###########################################################
CREATE TABLE htn__count_dx_period_month AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        
        , category_display, cond_display, cond_system_display, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display, cond_month        
        FROM htn__dx_period
        group by CUBE
        ( category_display, cond_display, cond_system_display, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display, cond_month )
    )
    select
          cnt_subject as cnt 
        , category_display, cond_display, cond_system_display, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display, cond_month
    from powerset 
    WHERE cnt_subject >= 10 
    ;

-- ###########################################################
CREATE TABLE htn__count_dx_period_week AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        
        , category_display, cond_display, cond_system_display, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display, cond_week        
        FROM htn__dx_period
        group by CUBE
        ( category_display, cond_display, cond_system_display, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display, cond_week )
    )
    select
          cnt_subject as cnt 
        , category_display, cond_display, cond_system_display, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display, cond_week
    from powerset 
    WHERE cnt_subject >= 10 
    ;

-- ###########################################################
CREATE TABLE htn__count_dx_period_date AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        
        , category_display, cond_display, cond_system_display, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display, cond_date        
        FROM htn__dx_period
        group by CUBE
        ( category_display, cond_display, cond_system_display, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display, cond_date )
    )
    select
          cnt_subject as cnt 
        , category_display, cond_display, cond_system_display, enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display, cond_date
    from powerset 
    WHERE cnt_subject >= 10 
    ;
