-- ###########################################################
CREATE TABLE htn__count_study_period AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        , count(distinct encounter_ref)   as cnt_encounter
        , enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display        
        FROM htn__study_period
        group by CUBE
        ( enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display )
    )
    select
          cnt_encounter  as cnt 
        , enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display
    from powerset 
    WHERE cnt_subject >= 10 
    ;

-- ###########################################################
CREATE TABLE htn__count_study_period_month AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        , count(distinct encounter_ref)   as cnt_encounter
        , enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display, start_month        
        FROM htn__study_period
        group by CUBE
        ( enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display, start_month )
    )
    select
          cnt_encounter  as cnt 
        , enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display, start_month
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
        , enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display, start_week        
        FROM htn__study_period
        group by CUBE
        ( enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display, start_week )
    )
    select
          cnt_encounter  as cnt 
        , enc_class_display, enc_type_display, age_at_visit, gender, race_display, ethnicity_display, start_week
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

-- ###########################################################
CREATE TABLE htn__count_prevalence_month AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        
        , hypertension, hypertension_lab, hypertension_dx, age_at_visit, gender, race_display, ethnicity_display, start_month        
        FROM htn__prevalence
        group by CUBE
        ( hypertension, hypertension_lab, hypertension_dx, age_at_visit, gender, race_display, ethnicity_display, start_month )
    )
    select
          cnt_subject as cnt 
        , hypertension, hypertension_lab, hypertension_dx, age_at_visit, gender, race_display, ethnicity_display, start_month
    from powerset 
    WHERE cnt_subject >= 10 
    ;

-- ###########################################################
CREATE TABLE htn__count_prevalence_week AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        
        , hypertension, hypertension_lab, hypertension_dx, age_at_visit, gender, race_display, ethnicity_display, start_week        
        FROM htn__prevalence
        group by CUBE
        ( hypertension, hypertension_lab, hypertension_dx, age_at_visit, gender, race_display, ethnicity_display, start_week )
    )
    select
          cnt_subject as cnt 
        , hypertension, hypertension_lab, hypertension_dx, age_at_visit, gender, race_display, ethnicity_display, start_week
    from powerset 
    WHERE cnt_subject >= 10 
    ;

-- ###########################################################
CREATE TABLE htn__count_comorbidity AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        
        , comorbidity_category_display, comorbidity_system_display, comorbidity_display, gender, race_display, ethnicity_display        
        FROM htn__comorbidity
        group by CUBE
        ( comorbidity_category_display, comorbidity_system_display, comorbidity_display, gender, race_display, ethnicity_display )
    )
    select
          cnt_subject as cnt 
        , comorbidity_category_display, comorbidity_system_display, comorbidity_display, gender, race_display, ethnicity_display
    from powerset 
    WHERE cnt_subject >= 10 
    ;

-- ###########################################################
CREATE TABLE htn__count_comorbidity_month AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        
        , comorbidity_category_display, comorbidity_system_display, comorbidity_display, gender, race_display, ethnicity_display, comorbidity_month        
        FROM htn__comorbidity
        group by CUBE
        ( comorbidity_category_display, comorbidity_system_display, comorbidity_display, gender, race_display, ethnicity_display, comorbidity_month )
    )
    select
          cnt_subject as cnt 
        , comorbidity_category_display, comorbidity_system_display, comorbidity_display, gender, race_display, ethnicity_display, comorbidity_month
    from powerset 
    WHERE cnt_subject >= 10 
    ;

-- ###########################################################
CREATE TABLE htn__count_comorbidity_week AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        
        , comorbidity_category_display, comorbidity_system_display, comorbidity_display, gender, race_display, ethnicity_display, comorbidity_week        
        FROM htn__comorbidity
        group by CUBE
        ( comorbidity_category_display, comorbidity_system_display, comorbidity_display, gender, race_display, ethnicity_display, comorbidity_week )
    )
    select
          cnt_subject as cnt 
        , comorbidity_category_display, comorbidity_system_display, comorbidity_display, gender, race_display, ethnicity_display, comorbidity_week
    from powerset 
    WHERE cnt_subject >= 10 
    ;

-- ###########################################################
CREATE TABLE htn__count_comorbidity_period AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        
        , comorbidity_category_display, comorbidity_system_display, comorbidity_display, enc_class_display, age_at_visit, gender, race_display, ethnicity_display        
        FROM htn__comorbidity_period
        group by CUBE
        ( comorbidity_category_display, comorbidity_system_display, comorbidity_display, enc_class_display, age_at_visit, gender, race_display, ethnicity_display )
    )
    select
          cnt_subject as cnt 
        , comorbidity_category_display, comorbidity_system_display, comorbidity_display, enc_class_display, age_at_visit, gender, race_display, ethnicity_display
    from powerset 
    WHERE cnt_subject >= 10 
    ;

-- ###########################################################
CREATE TABLE htn__count_comorbidity_period_month AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        
        , comorbidity_category_display, comorbidity_system_display, comorbidity_display, enc_class_display, age_at_visit, gender, race_display, ethnicity_display, start_month        
        FROM htn__comorbidity_period
        group by CUBE
        ( comorbidity_category_display, comorbidity_system_display, comorbidity_display, enc_class_display, age_at_visit, gender, race_display, ethnicity_display, start_month )
    )
    select
          cnt_subject as cnt 
        , comorbidity_category_display, comorbidity_system_display, comorbidity_display, enc_class_display, age_at_visit, gender, race_display, ethnicity_display, start_month
    from powerset 
    WHERE cnt_subject >= 10 
    ;

-- ###########################################################
CREATE TABLE htn__count_comorbidity_period_week AS 
    with powerset as
    (
        select
        count(distinct subject_ref)   as cnt_subject
        
        , comorbidity_category_display, comorbidity_system_display, comorbidity_display, enc_class_display, age_at_visit, gender, race_display, ethnicity_display, start_week        
        FROM htn__comorbidity_period
        group by CUBE
        ( comorbidity_category_display, comorbidity_system_display, comorbidity_display, enc_class_display, age_at_visit, gender, race_display, ethnicity_display, start_week )
    )
    select
          cnt_subject as cnt 
        , comorbidity_category_display, comorbidity_system_display, comorbidity_display, enc_class_display, age_at_visit, gender, race_display, ethnicity_display, start_week
    from powerset 
    WHERE cnt_subject >= 10 
    ;
