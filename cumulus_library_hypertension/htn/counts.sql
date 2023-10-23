-- noqa: disable=all

CREATE TABLE htn__count_study_period AS (
    WITH powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject,
            count(DISTINCT encounter_ref) AS cnt_encounter,
            "enc_class_display",
            "enc_type_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display"
        FROM htn__study_period
        GROUP BY
            cube(
                "enc_class_display",
                "enc_type_display",
                "age_at_visit",
                "gender",
                "race_display",
                "ethnicity_display"
            )
    )

    SELECT
        cnt_encounter AS cnt,
        "enc_class_display",
        "enc_type_display",
        "age_at_visit",
        "gender",
        "race_display",
        "ethnicity_display"
    FROM powerset
    WHERE 
        cnt_subject >= 10
);

-- ###########################################################

CREATE TABLE htn__count_study_period_month AS (
    WITH powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject,
            count(DISTINCT encounter_ref) AS cnt_encounter,
            "enc_class_display",
            "enc_type_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            "start_month"
        FROM htn__study_period
        GROUP BY
            cube(
                "enc_class_display",
                "enc_type_display",
                "age_at_visit",
                "gender",
                "race_display",
                "ethnicity_display",
                "start_month"
            )
    )

    SELECT
        cnt_encounter AS cnt,
        "enc_class_display",
        "enc_type_display",
        "age_at_visit",
        "gender",
        "race_display",
        "ethnicity_display",
        "start_month"
    FROM powerset
    WHERE 
        cnt_subject >= 10
);

-- ###########################################################

CREATE TABLE htn__count_study_period_week AS (
    WITH powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject,
            count(DISTINCT encounter_ref) AS cnt_encounter,
            "enc_class_display",
            "enc_type_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            "start_week"
        FROM htn__study_period
        GROUP BY
            cube(
                "enc_class_display",
                "enc_type_display",
                "age_at_visit",
                "gender",
                "race_display",
                "ethnicity_display",
                "start_week"
            )
    )

    SELECT
        cnt_encounter AS cnt,
        "enc_class_display",
        "enc_type_display",
        "age_at_visit",
        "gender",
        "race_display",
        "ethnicity_display",
        "start_week"
    FROM powerset
    WHERE 
        cnt_subject >= 10
);

-- ###########################################################

CREATE TABLE htn__count_bp AS (
    WITH powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject,
            "hypertension",
            "hypotension",
            "enc_class_display",
            "enc_type_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display"
        FROM htn__bp
        GROUP BY
            cube(
                "hypertension",
                "hypotension",
                "enc_class_display",
                "enc_type_display",
                "age_at_visit",
                "gender",
                "race_display",
                "ethnicity_display"
            )
    )

    SELECT
        cnt_subject AS cnt,
        "hypertension",
        "hypotension",
        "enc_class_display",
        "enc_type_display",
        "age_at_visit",
        "gender",
        "race_display",
        "ethnicity_display"
    FROM powerset
    WHERE 
        cnt_subject >= 10
);

-- ###########################################################

CREATE TABLE htn__count_bp_month AS (
    WITH powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject,
            "hypertension",
            "hypotension",
            "enc_class_display",
            "enc_type_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            "obs_month"
        FROM htn__bp
        GROUP BY
            cube(
                "hypertension",
                "hypotension",
                "enc_class_display",
                "enc_type_display",
                "age_at_visit",
                "gender",
                "race_display",
                "ethnicity_display",
                "obs_month"
            )
    )

    SELECT
        cnt_subject AS cnt,
        "hypertension",
        "hypotension",
        "enc_class_display",
        "enc_type_display",
        "age_at_visit",
        "gender",
        "race_display",
        "ethnicity_display",
        "obs_month"
    FROM powerset
    WHERE 
        cnt_subject >= 10
);

-- ###########################################################

CREATE TABLE htn__count_bp_week AS (
    WITH powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject,
            "hypertension",
            "hypotension",
            "enc_class_display",
            "enc_type_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            "obs_week"
        FROM htn__bp
        GROUP BY
            cube(
                "hypertension",
                "hypotension",
                "enc_class_display",
                "enc_type_display",
                "age_at_visit",
                "gender",
                "race_display",
                "ethnicity_display",
                "obs_week"
            )
    )

    SELECT
        cnt_subject AS cnt,
        "hypertension",
        "hypotension",
        "enc_class_display",
        "enc_type_display",
        "age_at_visit",
        "gender",
        "race_display",
        "ethnicity_display",
        "obs_week"
    FROM powerset
    WHERE 
        cnt_subject >= 10
);

-- ###########################################################

CREATE TABLE htn__count_bp_date AS (
    WITH powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject,
            "hypertension",
            "hypotension",
            "enc_class_display",
            "enc_type_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            "obs_date"
        FROM htn__bp
        GROUP BY
            cube(
                "hypertension",
                "hypotension",
                "enc_class_display",
                "enc_type_display",
                "age_at_visit",
                "gender",
                "race_display",
                "ethnicity_display",
                "obs_date"
            )
    )

    SELECT
        cnt_subject AS cnt,
        "hypertension",
        "hypotension",
        "enc_class_display",
        "enc_type_display",
        "age_at_visit",
        "gender",
        "race_display",
        "ethnicity_display",
        "obs_date"
    FROM powerset
    WHERE 
        cnt_subject >= 10
);

-- ###########################################################

CREATE TABLE htn__count_dx_month AS (
    WITH powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject,
            "category_display",
            "cond_display",
            "cond_system_display",
            "cond_month"
        FROM htn__dx
        GROUP BY
            cube(
                "category_display",
                "cond_display",
                "cond_system_display",
                "cond_month"
            )
    )

    SELECT
        cnt_subject AS cnt,
        "category_display",
        "cond_display",
        "cond_system_display",
        "cond_month"
    FROM powerset
    WHERE 
        cnt_subject >= 10
);

-- ###########################################################

CREATE TABLE htn__count_dx_week AS (
    WITH powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject,
            "category_display",
            "cond_display",
            "cond_system_display",
            "cond_week"
        FROM htn__dx
        GROUP BY
            cube(
                "category_display",
                "cond_display",
                "cond_system_display",
                "cond_week"
            )
    )

    SELECT
        cnt_subject AS cnt,
        "category_display",
        "cond_display",
        "cond_system_display",
        "cond_week"
    FROM powerset
    WHERE 
        cnt_subject >= 10
);

-- ###########################################################

CREATE TABLE htn__count_dx_date AS (
    WITH powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject,
            "category_display",
            "cond_display",
            "cond_system_display",
            "cond_date"
        FROM htn__dx
        GROUP BY
            cube(
                "category_display",
                "cond_display",
                "cond_system_display",
                "cond_date"
            )
    )

    SELECT
        cnt_subject AS cnt,
        "category_display",
        "cond_display",
        "cond_system_display",
        "cond_date"
    FROM powerset
    WHERE 
        cnt_subject >= 10
);

-- ###########################################################

CREATE TABLE htn__count_dx_period_month AS (
    WITH powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject,
            "category_display",
            "cond_display",
            "cond_system_display",
            "enc_class_display",
            "enc_type_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            "cond_month"
        FROM htn__dx_period
        GROUP BY
            cube(
                "category_display",
                "cond_display",
                "cond_system_display",
                "enc_class_display",
                "enc_type_display",
                "age_at_visit",
                "gender",
                "race_display",
                "ethnicity_display",
                "cond_month"
            )
    )

    SELECT
        cnt_subject AS cnt,
        "category_display",
        "cond_display",
        "cond_system_display",
        "enc_class_display",
        "enc_type_display",
        "age_at_visit",
        "gender",
        "race_display",
        "ethnicity_display",
        "cond_month"
    FROM powerset
    WHERE 
        cnt_subject >= 10
);

-- ###########################################################

CREATE TABLE htn__count_dx_period_week AS (
    WITH powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject,
            "category_display",
            "cond_display",
            "cond_system_display",
            "enc_class_display",
            "enc_type_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            "cond_week"
        FROM htn__dx_period
        GROUP BY
            cube(
                "category_display",
                "cond_display",
                "cond_system_display",
                "enc_class_display",
                "enc_type_display",
                "age_at_visit",
                "gender",
                "race_display",
                "ethnicity_display",
                "cond_week"
            )
    )

    SELECT
        cnt_subject AS cnt,
        "category_display",
        "cond_display",
        "cond_system_display",
        "enc_class_display",
        "enc_type_display",
        "age_at_visit",
        "gender",
        "race_display",
        "ethnicity_display",
        "cond_week"
    FROM powerset
    WHERE 
        cnt_subject >= 10
);

-- ###########################################################

CREATE TABLE htn__count_dx_period_date AS (
    WITH powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject,
            "category_display",
            "cond_display",
            "cond_system_display",
            "enc_class_display",
            "enc_type_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            "cond_date"
        FROM htn__dx_period
        GROUP BY
            cube(
                "category_display",
                "cond_display",
                "cond_system_display",
                "enc_class_display",
                "enc_type_display",
                "age_at_visit",
                "gender",
                "race_display",
                "ethnicity_display",
                "cond_date"
            )
    )

    SELECT
        cnt_subject AS cnt,
        "category_display",
        "cond_display",
        "cond_system_display",
        "enc_class_display",
        "enc_type_display",
        "age_at_visit",
        "gender",
        "race_display",
        "ethnicity_display",
        "cond_date"
    FROM powerset
    WHERE 
        cnt_subject >= 10
);

-- ###########################################################

CREATE TABLE htn__count_prevalence_month AS (
    WITH powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject,
            "hypertension",
            "hypertension_lab",
            "hypertension_dx",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            "start_month"
        FROM htn__prevalence
        GROUP BY
            cube(
                "hypertension",
                "hypertension_lab",
                "hypertension_dx",
                "age_at_visit",
                "gender",
                "race_display",
                "ethnicity_display",
                "start_month"
            )
    )

    SELECT
        cnt_subject AS cnt,
        "hypertension",
        "hypertension_lab",
        "hypertension_dx",
        "age_at_visit",
        "gender",
        "race_display",
        "ethnicity_display",
        "start_month"
    FROM powerset
    WHERE 
        cnt_subject >= 10
);

-- ###########################################################

CREATE TABLE htn__count_prevalence_week AS (
    WITH powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject,
            "hypertension",
            "hypertension_lab",
            "hypertension_dx",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            "start_week"
        FROM htn__prevalence
        GROUP BY
            cube(
                "hypertension",
                "hypertension_lab",
                "hypertension_dx",
                "age_at_visit",
                "gender",
                "race_display",
                "ethnicity_display",
                "start_week"
            )
    )

    SELECT
        cnt_subject AS cnt,
        "hypertension",
        "hypertension_lab",
        "hypertension_dx",
        "age_at_visit",
        "gender",
        "race_display",
        "ethnicity_display",
        "start_week"
    FROM powerset
    WHERE 
        cnt_subject >= 10
);

-- ###########################################################

CREATE TABLE htn__count_comorbidity AS (
    WITH powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject,
            "comorbidity_category_display",
            "comorbidity_system_display",
            "comorbidity_display",
            "gender",
            "race_display",
            "ethnicity_display"
        FROM htn__comorbidity
        GROUP BY
            cube(
                "comorbidity_category_display",
                "comorbidity_system_display",
                "comorbidity_display",
                "gender",
                "race_display",
                "ethnicity_display"
            )
    )

    SELECT
        cnt_subject AS cnt,
        "comorbidity_category_display",
        "comorbidity_system_display",
        "comorbidity_display",
        "gender",
        "race_display",
        "ethnicity_display"
    FROM powerset
    WHERE 
        cnt_subject >= 10
);

-- ###########################################################

CREATE TABLE htn__count_comorbidity_month AS (
    WITH powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject,
            "comorbidity_category_display",
            "comorbidity_system_display",
            "comorbidity_display",
            "gender",
            "race_display",
            "ethnicity_display",
            "comorbidity_month"
        FROM htn__comorbidity
        GROUP BY
            cube(
                "comorbidity_category_display",
                "comorbidity_system_display",
                "comorbidity_display",
                "gender",
                "race_display",
                "ethnicity_display",
                "comorbidity_month"
            )
    )

    SELECT
        cnt_subject AS cnt,
        "comorbidity_category_display",
        "comorbidity_system_display",
        "comorbidity_display",
        "gender",
        "race_display",
        "ethnicity_display",
        "comorbidity_month"
    FROM powerset
    WHERE 
        cnt_subject >= 10
);

-- ###########################################################

CREATE TABLE htn__count_comorbidity_week AS (
    WITH powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject,
            "comorbidity_category_display",
            "comorbidity_system_display",
            "comorbidity_display",
            "gender",
            "race_display",
            "ethnicity_display",
            "comorbidity_week"
        FROM htn__comorbidity
        GROUP BY
            cube(
                "comorbidity_category_display",
                "comorbidity_system_display",
                "comorbidity_display",
                "gender",
                "race_display",
                "ethnicity_display",
                "comorbidity_week"
            )
    )

    SELECT
        cnt_subject AS cnt,
        "comorbidity_category_display",
        "comorbidity_system_display",
        "comorbidity_display",
        "gender",
        "race_display",
        "ethnicity_display",
        "comorbidity_week"
    FROM powerset
    WHERE 
        cnt_subject >= 10
);

-- ###########################################################

CREATE TABLE htn__count_comorbidity_period AS (
    WITH powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject,
            "comorbidity_category_display",
            "comorbidity_system_display",
            "comorbidity_display",
            "enc_class_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display"
        FROM htn__comorbidity_period
        GROUP BY
            cube(
                "comorbidity_category_display",
                "comorbidity_system_display",
                "comorbidity_display",
                "enc_class_display",
                "age_at_visit",
                "gender",
                "race_display",
                "ethnicity_display"
            )
    )

    SELECT
        cnt_subject AS cnt,
        "comorbidity_category_display",
        "comorbidity_system_display",
        "comorbidity_display",
        "enc_class_display",
        "age_at_visit",
        "gender",
        "race_display",
        "ethnicity_display"
    FROM powerset
    WHERE 
        cnt_subject >= 10
);

-- ###########################################################

CREATE TABLE htn__count_comorbidity_period_month AS (
    WITH powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject,
            "comorbidity_category_display",
            "comorbidity_system_display",
            "comorbidity_display",
            "enc_class_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            "start_month"
        FROM htn__comorbidity_period
        GROUP BY
            cube(
                "comorbidity_category_display",
                "comorbidity_system_display",
                "comorbidity_display",
                "enc_class_display",
                "age_at_visit",
                "gender",
                "race_display",
                "ethnicity_display",
                "start_month"
            )
    )

    SELECT
        cnt_subject AS cnt,
        "comorbidity_category_display",
        "comorbidity_system_display",
        "comorbidity_display",
        "enc_class_display",
        "age_at_visit",
        "gender",
        "race_display",
        "ethnicity_display",
        "start_month"
    FROM powerset
    WHERE 
        cnt_subject >= 10
);

-- ###########################################################

CREATE TABLE htn__count_comorbidity_period_week AS (
    WITH powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject,
            "comorbidity_category_display",
            "comorbidity_system_display",
            "comorbidity_display",
            "enc_class_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            "start_week"
        FROM htn__comorbidity_period
        GROUP BY
            cube(
                "comorbidity_category_display",
                "comorbidity_system_display",
                "comorbidity_display",
                "enc_class_display",
                "age_at_visit",
                "gender",
                "race_display",
                "ethnicity_display",
                "start_week"
            )
    )

    SELECT
        cnt_subject AS cnt,
        "comorbidity_category_display",
        "comorbidity_system_display",
        "comorbidity_display",
        "enc_class_display",
        "age_at_visit",
        "gender",
        "race_display",
        "ethnicity_display",
        "start_week"
    FROM powerset
    WHERE 
        cnt_subject >= 10
);
