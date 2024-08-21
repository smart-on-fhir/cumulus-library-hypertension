-- noqa: disable=all
CREATE TABLE htn__count_study_period AS (
    WITH
    filtered_table AS (
        SELECT
            s.subject_ref,
            s.encounter_ref,
            --noqa: disable=RF03, AL02
            s."enc_class_display",
            s."enc_type_display",
            s."age_at_visit",
            s."gender",
            s."race_display",
            s."ethnicity_display"
            --noqa: enable=RF03, AL02
        FROM htn__study_period AS s
        WHERE s.status = 'finished'
    ),
    
    null_replacement AS (
        SELECT
            subject_ref,
            encounter_ref,
            coalesce(
                cast(enc_class_display AS varchar),
                'cumulus__none'
            ) AS enc_class_display,
            coalesce(
                cast(enc_type_display AS varchar),
                'cumulus__none'
            ) AS enc_type_display,
            coalesce(
                cast(age_at_visit AS varchar),
                'cumulus__none'
            ) AS age_at_visit,
            coalesce(
                cast(gender AS varchar),
                'cumulus__none'
            ) AS gender,
            coalesce(
                cast(race_display AS varchar),
                'cumulus__none'
            ) AS race_display,
            coalesce(
                cast(ethnicity_display AS varchar),
                'cumulus__none'
            ) AS ethnicity_display
        FROM filtered_table
    ),
    secondary_powerset AS (
        SELECT
            count(DISTINCT encounter_ref) AS cnt_encounter_ref,
            "enc_class_display",
            "enc_type_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            concat_ws(
                '-',
                COALESCE("enc_class_display",''),
                COALESCE("enc_type_display",''),
                COALESCE("age_at_visit",''),
                COALESCE("gender",''),
                COALESCE("race_display",''),
                COALESCE("ethnicity_display",'')
            ) AS id
        FROM null_replacement
        GROUP BY
            cube(
            "enc_class_display",
            "enc_type_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display"
            )
    ),

    powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject_ref,
            "enc_class_display",
            "enc_type_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            concat_ws(
                '-',
                COALESCE("enc_class_display",''),
                COALESCE("enc_type_display",''),
                COALESCE("age_at_visit",''),
                COALESCE("gender",''),
                COALESCE("race_display",''),
                COALESCE("ethnicity_display",'')
            ) AS id
        FROM null_replacement
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
        s.cnt_encounter_ref AS cnt,
        p."enc_class_display",
        p."enc_type_display",
        p."age_at_visit",
        p."gender",
        p."race_display",
        p."ethnicity_display"
    FROM powerset AS p
    JOIN secondary_powerset AS s on s.id = p.id
    WHERE 
        cnt_subject_ref >= 10
);

-- ###########################################################

CREATE TABLE htn__count_study_period_month AS (
    WITH
    filtered_table AS (
        SELECT
            s.subject_ref,
            s.encounter_ref,
            --noqa: disable=RF03, AL02
            s."enc_class_display",
            s."enc_type_display",
            s."age_at_visit",
            s."gender",
            s."race_display",
            s."ethnicity_display",
            s."start_month"
            --noqa: enable=RF03, AL02
        FROM htn__study_period AS s
        WHERE s.status = 'finished'
    ),
    
    null_replacement AS (
        SELECT
            subject_ref,
            encounter_ref,
            coalesce(
                cast(enc_class_display AS varchar),
                'cumulus__none'
            ) AS enc_class_display,
            coalesce(
                cast(enc_type_display AS varchar),
                'cumulus__none'
            ) AS enc_type_display,
            coalesce(
                cast(age_at_visit AS varchar),
                'cumulus__none'
            ) AS age_at_visit,
            coalesce(
                cast(gender AS varchar),
                'cumulus__none'
            ) AS gender,
            coalesce(
                cast(race_display AS varchar),
                'cumulus__none'
            ) AS race_display,
            coalesce(
                cast(ethnicity_display AS varchar),
                'cumulus__none'
            ) AS ethnicity_display,
            coalesce(
                cast(start_month AS varchar),
                'cumulus__none'
            ) AS start_month
        FROM filtered_table
    ),
    secondary_powerset AS (
        SELECT
            count(DISTINCT encounter_ref) AS cnt_encounter_ref,
            "enc_class_display",
            "enc_type_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            "start_month",
            concat_ws(
                '-',
                COALESCE("enc_class_display",''),
                COALESCE("enc_type_display",''),
                COALESCE("age_at_visit",''),
                COALESCE("gender",''),
                COALESCE("race_display",''),
                COALESCE("ethnicity_display",''),
                COALESCE("start_month",'')
            ) AS id
        FROM null_replacement
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
    ),

    powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject_ref,
            "enc_class_display",
            "enc_type_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            "start_month",
            concat_ws(
                '-',
                COALESCE("enc_class_display",''),
                COALESCE("enc_type_display",''),
                COALESCE("age_at_visit",''),
                COALESCE("gender",''),
                COALESCE("race_display",''),
                COALESCE("ethnicity_display",''),
                COALESCE("start_month",'')
            ) AS id
        FROM null_replacement
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
        s.cnt_encounter_ref AS cnt,
        p."enc_class_display",
        p."enc_type_display",
        p."age_at_visit",
        p."gender",
        p."race_display",
        p."ethnicity_display",
        p."start_month"
    FROM powerset AS p
    JOIN secondary_powerset AS s on s.id = p.id
    WHERE 
        cnt_subject_ref >= 10
);

-- ###########################################################

CREATE TABLE htn__count_study_period_week AS (
    WITH
    filtered_table AS (
        SELECT
            s.subject_ref,
            s.encounter_ref,
            --noqa: disable=RF03, AL02
            s."enc_class_display",
            s."enc_type_display",
            s."age_at_visit",
            s."gender",
            s."race_display",
            s."ethnicity_display",
            s."start_week"
            --noqa: enable=RF03, AL02
        FROM htn__study_period AS s
        WHERE s.status = 'finished'
    ),
    
    null_replacement AS (
        SELECT
            subject_ref,
            encounter_ref,
            coalesce(
                cast(enc_class_display AS varchar),
                'cumulus__none'
            ) AS enc_class_display,
            coalesce(
                cast(enc_type_display AS varchar),
                'cumulus__none'
            ) AS enc_type_display,
            coalesce(
                cast(age_at_visit AS varchar),
                'cumulus__none'
            ) AS age_at_visit,
            coalesce(
                cast(gender AS varchar),
                'cumulus__none'
            ) AS gender,
            coalesce(
                cast(race_display AS varchar),
                'cumulus__none'
            ) AS race_display,
            coalesce(
                cast(ethnicity_display AS varchar),
                'cumulus__none'
            ) AS ethnicity_display,
            coalesce(
                cast(start_week AS varchar),
                'cumulus__none'
            ) AS start_week
        FROM filtered_table
    ),
    secondary_powerset AS (
        SELECT
            count(DISTINCT encounter_ref) AS cnt_encounter_ref,
            "enc_class_display",
            "enc_type_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            "start_week",
            concat_ws(
                '-',
                COALESCE("enc_class_display",''),
                COALESCE("enc_type_display",''),
                COALESCE("age_at_visit",''),
                COALESCE("gender",''),
                COALESCE("race_display",''),
                COALESCE("ethnicity_display",''),
                COALESCE("start_week",'')
            ) AS id
        FROM null_replacement
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
    ),

    powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject_ref,
            "enc_class_display",
            "enc_type_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            "start_week",
            concat_ws(
                '-',
                COALESCE("enc_class_display",''),
                COALESCE("enc_type_display",''),
                COALESCE("age_at_visit",''),
                COALESCE("gender",''),
                COALESCE("race_display",''),
                COALESCE("ethnicity_display",''),
                COALESCE("start_week",'')
            ) AS id
        FROM null_replacement
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
        s.cnt_encounter_ref AS cnt,
        p."enc_class_display",
        p."enc_type_display",
        p."age_at_visit",
        p."gender",
        p."race_display",
        p."ethnicity_display",
        p."start_week"
    FROM powerset AS p
    JOIN secondary_powerset AS s on s.id = p.id
    WHERE 
        cnt_subject_ref >= 10
);

-- ###########################################################

CREATE TABLE htn__count_bp AS (
    WITH
    filtered_table AS (
        SELECT
            s.subject_ref,
            --noqa: disable=RF03, AL02
            s."hypertension",
            s."hypotension",
            s."enc_class_display",
            s."enc_type_display",
            s."age_at_visit",
            s."gender",
            s."race_display",
            s."ethnicity_display"
            --noqa: enable=RF03, AL02
        FROM htn__bp AS s
    ),
    
    null_replacement AS (
        SELECT
            subject_ref,
            coalesce(
                cast(hypertension AS varchar),
                'cumulus__none'
            ) AS hypertension,
            coalesce(
                cast(hypotension AS varchar),
                'cumulus__none'
            ) AS hypotension,
            coalesce(
                cast(enc_class_display AS varchar),
                'cumulus__none'
            ) AS enc_class_display,
            coalesce(
                cast(enc_type_display AS varchar),
                'cumulus__none'
            ) AS enc_type_display,
            coalesce(
                cast(age_at_visit AS varchar),
                'cumulus__none'
            ) AS age_at_visit,
            coalesce(
                cast(gender AS varchar),
                'cumulus__none'
            ) AS gender,
            coalesce(
                cast(race_display AS varchar),
                'cumulus__none'
            ) AS race_display,
            coalesce(
                cast(ethnicity_display AS varchar),
                'cumulus__none'
            ) AS ethnicity_display
        FROM filtered_table
    ),

    powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject_ref,
            "hypertension",
            "hypotension",
            "enc_class_display",
            "enc_type_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            concat_ws(
                '-',
                COALESCE("hypertension",''),
                COALESCE("hypotension",''),
                COALESCE("enc_class_display",''),
                COALESCE("enc_type_display",''),
                COALESCE("age_at_visit",''),
                COALESCE("gender",''),
                COALESCE("race_display",''),
                COALESCE("ethnicity_display",'')
            ) AS id
        FROM null_replacement
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
        p.cnt_subject_ref AS cnt,
        p."hypertension",
        p."hypotension",
        p."enc_class_display",
        p."enc_type_display",
        p."age_at_visit",
        p."gender",
        p."race_display",
        p."ethnicity_display"
    FROM powerset AS p
    WHERE 
        cnt_subject_ref >= 10
);

-- ###########################################################

CREATE TABLE htn__count_bp_month AS (
    WITH
    filtered_table AS (
        SELECT
            s.subject_ref,
            --noqa: disable=RF03, AL02
            s."hypertension",
            s."hypotension",
            s."enc_class_display",
            s."enc_type_display",
            s."age_at_visit",
            s."gender",
            s."race_display",
            s."ethnicity_display",
            s."obs_month"
            --noqa: enable=RF03, AL02
        FROM htn__bp AS s
    ),
    
    null_replacement AS (
        SELECT
            subject_ref,
            coalesce(
                cast(hypertension AS varchar),
                'cumulus__none'
            ) AS hypertension,
            coalesce(
                cast(hypotension AS varchar),
                'cumulus__none'
            ) AS hypotension,
            coalesce(
                cast(enc_class_display AS varchar),
                'cumulus__none'
            ) AS enc_class_display,
            coalesce(
                cast(enc_type_display AS varchar),
                'cumulus__none'
            ) AS enc_type_display,
            coalesce(
                cast(age_at_visit AS varchar),
                'cumulus__none'
            ) AS age_at_visit,
            coalesce(
                cast(gender AS varchar),
                'cumulus__none'
            ) AS gender,
            coalesce(
                cast(race_display AS varchar),
                'cumulus__none'
            ) AS race_display,
            coalesce(
                cast(ethnicity_display AS varchar),
                'cumulus__none'
            ) AS ethnicity_display,
            coalesce(
                cast(obs_month AS varchar),
                'cumulus__none'
            ) AS obs_month
        FROM filtered_table
    ),

    powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject_ref,
            "hypertension",
            "hypotension",
            "enc_class_display",
            "enc_type_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            "obs_month",
            concat_ws(
                '-',
                COALESCE("hypertension",''),
                COALESCE("hypotension",''),
                COALESCE("enc_class_display",''),
                COALESCE("enc_type_display",''),
                COALESCE("age_at_visit",''),
                COALESCE("gender",''),
                COALESCE("race_display",''),
                COALESCE("ethnicity_display",''),
                COALESCE("obs_month",'')
            ) AS id
        FROM null_replacement
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
        p.cnt_subject_ref AS cnt,
        p."hypertension",
        p."hypotension",
        p."enc_class_display",
        p."enc_type_display",
        p."age_at_visit",
        p."gender",
        p."race_display",
        p."ethnicity_display",
        p."obs_month"
    FROM powerset AS p
    WHERE 
        cnt_subject_ref >= 10
);

-- ###########################################################

CREATE TABLE htn__count_bp_week AS (
    WITH
    filtered_table AS (
        SELECT
            s.subject_ref,
            --noqa: disable=RF03, AL02
            s."hypertension",
            s."hypotension",
            s."enc_class_display",
            s."enc_type_display",
            s."age_at_visit",
            s."gender",
            s."race_display",
            s."ethnicity_display",
            s."obs_week"
            --noqa: enable=RF03, AL02
        FROM htn__bp AS s
    ),
    
    null_replacement AS (
        SELECT
            subject_ref,
            coalesce(
                cast(hypertension AS varchar),
                'cumulus__none'
            ) AS hypertension,
            coalesce(
                cast(hypotension AS varchar),
                'cumulus__none'
            ) AS hypotension,
            coalesce(
                cast(enc_class_display AS varchar),
                'cumulus__none'
            ) AS enc_class_display,
            coalesce(
                cast(enc_type_display AS varchar),
                'cumulus__none'
            ) AS enc_type_display,
            coalesce(
                cast(age_at_visit AS varchar),
                'cumulus__none'
            ) AS age_at_visit,
            coalesce(
                cast(gender AS varchar),
                'cumulus__none'
            ) AS gender,
            coalesce(
                cast(race_display AS varchar),
                'cumulus__none'
            ) AS race_display,
            coalesce(
                cast(ethnicity_display AS varchar),
                'cumulus__none'
            ) AS ethnicity_display,
            coalesce(
                cast(obs_week AS varchar),
                'cumulus__none'
            ) AS obs_week
        FROM filtered_table
    ),

    powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject_ref,
            "hypertension",
            "hypotension",
            "enc_class_display",
            "enc_type_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            "obs_week",
            concat_ws(
                '-',
                COALESCE("hypertension",''),
                COALESCE("hypotension",''),
                COALESCE("enc_class_display",''),
                COALESCE("enc_type_display",''),
                COALESCE("age_at_visit",''),
                COALESCE("gender",''),
                COALESCE("race_display",''),
                COALESCE("ethnicity_display",''),
                COALESCE("obs_week",'')
            ) AS id
        FROM null_replacement
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
        p.cnt_subject_ref AS cnt,
        p."hypertension",
        p."hypotension",
        p."enc_class_display",
        p."enc_type_display",
        p."age_at_visit",
        p."gender",
        p."race_display",
        p."ethnicity_display",
        p."obs_week"
    FROM powerset AS p
    WHERE 
        cnt_subject_ref >= 10
);

-- ###########################################################

CREATE TABLE htn__count_bp_date AS (
    WITH
    filtered_table AS (
        SELECT
            s.subject_ref,
            --noqa: disable=RF03, AL02
            s."hypertension",
            s."hypotension",
            s."enc_class_display",
            s."enc_type_display",
            s."age_at_visit",
            s."gender",
            s."race_display",
            s."ethnicity_display",
            s."obs_date"
            --noqa: enable=RF03, AL02
        FROM htn__bp AS s
    ),
    
    null_replacement AS (
        SELECT
            subject_ref,
            coalesce(
                cast(hypertension AS varchar),
                'cumulus__none'
            ) AS hypertension,
            coalesce(
                cast(hypotension AS varchar),
                'cumulus__none'
            ) AS hypotension,
            coalesce(
                cast(enc_class_display AS varchar),
                'cumulus__none'
            ) AS enc_class_display,
            coalesce(
                cast(enc_type_display AS varchar),
                'cumulus__none'
            ) AS enc_type_display,
            coalesce(
                cast(age_at_visit AS varchar),
                'cumulus__none'
            ) AS age_at_visit,
            coalesce(
                cast(gender AS varchar),
                'cumulus__none'
            ) AS gender,
            coalesce(
                cast(race_display AS varchar),
                'cumulus__none'
            ) AS race_display,
            coalesce(
                cast(ethnicity_display AS varchar),
                'cumulus__none'
            ) AS ethnicity_display,
            coalesce(
                cast(obs_date AS varchar),
                'cumulus__none'
            ) AS obs_date
        FROM filtered_table
    ),

    powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject_ref,
            "hypertension",
            "hypotension",
            "enc_class_display",
            "enc_type_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            "obs_date",
            concat_ws(
                '-',
                COALESCE("hypertension",''),
                COALESCE("hypotension",''),
                COALESCE("enc_class_display",''),
                COALESCE("enc_type_display",''),
                COALESCE("age_at_visit",''),
                COALESCE("gender",''),
                COALESCE("race_display",''),
                COALESCE("ethnicity_display",''),
                COALESCE("obs_date",'')
            ) AS id
        FROM null_replacement
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
        p.cnt_subject_ref AS cnt,
        p."hypertension",
        p."hypotension",
        p."enc_class_display",
        p."enc_type_display",
        p."age_at_visit",
        p."gender",
        p."race_display",
        p."ethnicity_display",
        p."obs_date"
    FROM powerset AS p
    WHERE 
        cnt_subject_ref >= 10
);

-- ###########################################################

CREATE TABLE htn__count_dx_month AS (
    WITH
    filtered_table AS (
        SELECT
            s.subject_ref,
            --noqa: disable=RF03, AL02
            s."category_display",
            s."cond_display",
            s."cond_system_display",
            s."cond_month"
            --noqa: enable=RF03, AL02
        FROM htn__dx AS s
    ),
    
    null_replacement AS (
        SELECT
            subject_ref,
            coalesce(
                cast(category_display AS varchar),
                'cumulus__none'
            ) AS category_display,
            coalesce(
                cast(cond_display AS varchar),
                'cumulus__none'
            ) AS cond_display,
            coalesce(
                cast(cond_system_display AS varchar),
                'cumulus__none'
            ) AS cond_system_display,
            coalesce(
                cast(cond_month AS varchar),
                'cumulus__none'
            ) AS cond_month
        FROM filtered_table
    ),

    powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject_ref,
            "category_display",
            "cond_display",
            "cond_system_display",
            "cond_month",
            concat_ws(
                '-',
                COALESCE("category_display",''),
                COALESCE("cond_display",''),
                COALESCE("cond_system_display",''),
                COALESCE("cond_month",'')
            ) AS id
        FROM null_replacement
        GROUP BY
            cube(
            "category_display",
            "cond_display",
            "cond_system_display",
            "cond_month"
            )
    )

    SELECT
        p.cnt_subject_ref AS cnt,
        p."category_display",
        p."cond_display",
        p."cond_system_display",
        p."cond_month"
    FROM powerset AS p
    WHERE 
        cnt_subject_ref >= 10
);

-- ###########################################################

CREATE TABLE htn__count_dx_week AS (
    WITH
    filtered_table AS (
        SELECT
            s.subject_ref,
            --noqa: disable=RF03, AL02
            s."category_display",
            s."cond_display",
            s."cond_system_display",
            s."cond_week"
            --noqa: enable=RF03, AL02
        FROM htn__dx AS s
    ),
    
    null_replacement AS (
        SELECT
            subject_ref,
            coalesce(
                cast(category_display AS varchar),
                'cumulus__none'
            ) AS category_display,
            coalesce(
                cast(cond_display AS varchar),
                'cumulus__none'
            ) AS cond_display,
            coalesce(
                cast(cond_system_display AS varchar),
                'cumulus__none'
            ) AS cond_system_display,
            coalesce(
                cast(cond_week AS varchar),
                'cumulus__none'
            ) AS cond_week
        FROM filtered_table
    ),

    powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject_ref,
            "category_display",
            "cond_display",
            "cond_system_display",
            "cond_week",
            concat_ws(
                '-',
                COALESCE("category_display",''),
                COALESCE("cond_display",''),
                COALESCE("cond_system_display",''),
                COALESCE("cond_week",'')
            ) AS id
        FROM null_replacement
        GROUP BY
            cube(
            "category_display",
            "cond_display",
            "cond_system_display",
            "cond_week"
            )
    )

    SELECT
        p.cnt_subject_ref AS cnt,
        p."category_display",
        p."cond_display",
        p."cond_system_display",
        p."cond_week"
    FROM powerset AS p
    WHERE 
        cnt_subject_ref >= 10
);

-- ###########################################################

CREATE TABLE htn__count_dx_date AS (
    WITH
    filtered_table AS (
        SELECT
            s.subject_ref,
            --noqa: disable=RF03, AL02
            s."category_display",
            s."cond_display",
            s."cond_system_display",
            s."cond_date"
            --noqa: enable=RF03, AL02
        FROM htn__dx AS s
    ),
    
    null_replacement AS (
        SELECT
            subject_ref,
            coalesce(
                cast(category_display AS varchar),
                'cumulus__none'
            ) AS category_display,
            coalesce(
                cast(cond_display AS varchar),
                'cumulus__none'
            ) AS cond_display,
            coalesce(
                cast(cond_system_display AS varchar),
                'cumulus__none'
            ) AS cond_system_display,
            coalesce(
                cast(cond_date AS varchar),
                'cumulus__none'
            ) AS cond_date
        FROM filtered_table
    ),

    powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject_ref,
            "category_display",
            "cond_display",
            "cond_system_display",
            "cond_date",
            concat_ws(
                '-',
                COALESCE("category_display",''),
                COALESCE("cond_display",''),
                COALESCE("cond_system_display",''),
                COALESCE("cond_date",'')
            ) AS id
        FROM null_replacement
        GROUP BY
            cube(
            "category_display",
            "cond_display",
            "cond_system_display",
            "cond_date"
            )
    )

    SELECT
        p.cnt_subject_ref AS cnt,
        p."category_display",
        p."cond_display",
        p."cond_system_display",
        p."cond_date"
    FROM powerset AS p
    WHERE 
        cnt_subject_ref >= 10
);

-- ###########################################################

CREATE TABLE htn__count_dx_period_month AS (
    WITH
    filtered_table AS (
        SELECT
            s.subject_ref,
            --noqa: disable=RF03, AL02
            s."category_display",
            s."cond_display",
            s."cond_system_display",
            s."enc_class_display",
            s."enc_type_display",
            s."age_at_visit",
            s."gender",
            s."race_display",
            s."ethnicity_display",
            s."cond_month"
            --noqa: enable=RF03, AL02
        FROM htn__dx_period AS s
    ),
    
    null_replacement AS (
        SELECT
            subject_ref,
            coalesce(
                cast(category_display AS varchar),
                'cumulus__none'
            ) AS category_display,
            coalesce(
                cast(cond_display AS varchar),
                'cumulus__none'
            ) AS cond_display,
            coalesce(
                cast(cond_system_display AS varchar),
                'cumulus__none'
            ) AS cond_system_display,
            coalesce(
                cast(enc_class_display AS varchar),
                'cumulus__none'
            ) AS enc_class_display,
            coalesce(
                cast(enc_type_display AS varchar),
                'cumulus__none'
            ) AS enc_type_display,
            coalesce(
                cast(age_at_visit AS varchar),
                'cumulus__none'
            ) AS age_at_visit,
            coalesce(
                cast(gender AS varchar),
                'cumulus__none'
            ) AS gender,
            coalesce(
                cast(race_display AS varchar),
                'cumulus__none'
            ) AS race_display,
            coalesce(
                cast(ethnicity_display AS varchar),
                'cumulus__none'
            ) AS ethnicity_display,
            coalesce(
                cast(cond_month AS varchar),
                'cumulus__none'
            ) AS cond_month
        FROM filtered_table
    ),

    powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject_ref,
            "category_display",
            "cond_display",
            "cond_system_display",
            "enc_class_display",
            "enc_type_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            "cond_month",
            concat_ws(
                '-',
                COALESCE("category_display",''),
                COALESCE("cond_display",''),
                COALESCE("cond_system_display",''),
                COALESCE("enc_class_display",''),
                COALESCE("enc_type_display",''),
                COALESCE("age_at_visit",''),
                COALESCE("gender",''),
                COALESCE("race_display",''),
                COALESCE("ethnicity_display",''),
                COALESCE("cond_month",'')
            ) AS id
        FROM null_replacement
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
        p.cnt_subject_ref AS cnt,
        p."category_display",
        p."cond_display",
        p."cond_system_display",
        p."enc_class_display",
        p."enc_type_display",
        p."age_at_visit",
        p."gender",
        p."race_display",
        p."ethnicity_display",
        p."cond_month"
    FROM powerset AS p
    WHERE 
        cnt_subject_ref >= 10
);

-- ###########################################################

CREATE TABLE htn__count_dx_period_week AS (
    WITH
    filtered_table AS (
        SELECT
            s.subject_ref,
            --noqa: disable=RF03, AL02
            s."category_display",
            s."cond_display",
            s."cond_system_display",
            s."enc_class_display",
            s."enc_type_display",
            s."age_at_visit",
            s."gender",
            s."race_display",
            s."ethnicity_display",
            s."cond_week"
            --noqa: enable=RF03, AL02
        FROM htn__dx_period AS s
    ),
    
    null_replacement AS (
        SELECT
            subject_ref,
            coalesce(
                cast(category_display AS varchar),
                'cumulus__none'
            ) AS category_display,
            coalesce(
                cast(cond_display AS varchar),
                'cumulus__none'
            ) AS cond_display,
            coalesce(
                cast(cond_system_display AS varchar),
                'cumulus__none'
            ) AS cond_system_display,
            coalesce(
                cast(enc_class_display AS varchar),
                'cumulus__none'
            ) AS enc_class_display,
            coalesce(
                cast(enc_type_display AS varchar),
                'cumulus__none'
            ) AS enc_type_display,
            coalesce(
                cast(age_at_visit AS varchar),
                'cumulus__none'
            ) AS age_at_visit,
            coalesce(
                cast(gender AS varchar),
                'cumulus__none'
            ) AS gender,
            coalesce(
                cast(race_display AS varchar),
                'cumulus__none'
            ) AS race_display,
            coalesce(
                cast(ethnicity_display AS varchar),
                'cumulus__none'
            ) AS ethnicity_display,
            coalesce(
                cast(cond_week AS varchar),
                'cumulus__none'
            ) AS cond_week
        FROM filtered_table
    ),

    powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject_ref,
            "category_display",
            "cond_display",
            "cond_system_display",
            "enc_class_display",
            "enc_type_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            "cond_week",
            concat_ws(
                '-',
                COALESCE("category_display",''),
                COALESCE("cond_display",''),
                COALESCE("cond_system_display",''),
                COALESCE("enc_class_display",''),
                COALESCE("enc_type_display",''),
                COALESCE("age_at_visit",''),
                COALESCE("gender",''),
                COALESCE("race_display",''),
                COALESCE("ethnicity_display",''),
                COALESCE("cond_week",'')
            ) AS id
        FROM null_replacement
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
        p.cnt_subject_ref AS cnt,
        p."category_display",
        p."cond_display",
        p."cond_system_display",
        p."enc_class_display",
        p."enc_type_display",
        p."age_at_visit",
        p."gender",
        p."race_display",
        p."ethnicity_display",
        p."cond_week"
    FROM powerset AS p
    WHERE 
        cnt_subject_ref >= 10
);

-- ###########################################################

CREATE TABLE htn__count_dx_period_date AS (
    WITH
    filtered_table AS (
        SELECT
            s.subject_ref,
            --noqa: disable=RF03, AL02
            s."category_display",
            s."cond_display",
            s."cond_system_display",
            s."enc_class_display",
            s."enc_type_display",
            s."age_at_visit",
            s."gender",
            s."race_display",
            s."ethnicity_display",
            s."cond_date"
            --noqa: enable=RF03, AL02
        FROM htn__dx_period AS s
    ),
    
    null_replacement AS (
        SELECT
            subject_ref,
            coalesce(
                cast(category_display AS varchar),
                'cumulus__none'
            ) AS category_display,
            coalesce(
                cast(cond_display AS varchar),
                'cumulus__none'
            ) AS cond_display,
            coalesce(
                cast(cond_system_display AS varchar),
                'cumulus__none'
            ) AS cond_system_display,
            coalesce(
                cast(enc_class_display AS varchar),
                'cumulus__none'
            ) AS enc_class_display,
            coalesce(
                cast(enc_type_display AS varchar),
                'cumulus__none'
            ) AS enc_type_display,
            coalesce(
                cast(age_at_visit AS varchar),
                'cumulus__none'
            ) AS age_at_visit,
            coalesce(
                cast(gender AS varchar),
                'cumulus__none'
            ) AS gender,
            coalesce(
                cast(race_display AS varchar),
                'cumulus__none'
            ) AS race_display,
            coalesce(
                cast(ethnicity_display AS varchar),
                'cumulus__none'
            ) AS ethnicity_display,
            coalesce(
                cast(cond_date AS varchar),
                'cumulus__none'
            ) AS cond_date
        FROM filtered_table
    ),

    powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject_ref,
            "category_display",
            "cond_display",
            "cond_system_display",
            "enc_class_display",
            "enc_type_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            "cond_date",
            concat_ws(
                '-',
                COALESCE("category_display",''),
                COALESCE("cond_display",''),
                COALESCE("cond_system_display",''),
                COALESCE("enc_class_display",''),
                COALESCE("enc_type_display",''),
                COALESCE("age_at_visit",''),
                COALESCE("gender",''),
                COALESCE("race_display",''),
                COALESCE("ethnicity_display",''),
                COALESCE("cond_date",'')
            ) AS id
        FROM null_replacement
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
        p.cnt_subject_ref AS cnt,
        p."category_display",
        p."cond_display",
        p."cond_system_display",
        p."enc_class_display",
        p."enc_type_display",
        p."age_at_visit",
        p."gender",
        p."race_display",
        p."ethnicity_display",
        p."cond_date"
    FROM powerset AS p
    WHERE 
        cnt_subject_ref >= 10
);

-- ###########################################################

CREATE TABLE htn__count_prevalence_month AS (
    WITH
    filtered_table AS (
        SELECT
            s.subject_ref,
            --noqa: disable=RF03, AL02
            s."hypertension",
            s."hypertension_lab",
            s."hypertension_dx",
            s."age_at_visit",
            s."gender",
            s."race_display",
            s."ethnicity_display",
            s."start_month"
            --noqa: enable=RF03, AL02
        FROM htn__prevalence AS s
    ),
    
    null_replacement AS (
        SELECT
            subject_ref,
            coalesce(
                cast(hypertension AS varchar),
                'cumulus__none'
            ) AS hypertension,
            coalesce(
                cast(hypertension_lab AS varchar),
                'cumulus__none'
            ) AS hypertension_lab,
            coalesce(
                cast(hypertension_dx AS varchar),
                'cumulus__none'
            ) AS hypertension_dx,
            coalesce(
                cast(age_at_visit AS varchar),
                'cumulus__none'
            ) AS age_at_visit,
            coalesce(
                cast(gender AS varchar),
                'cumulus__none'
            ) AS gender,
            coalesce(
                cast(race_display AS varchar),
                'cumulus__none'
            ) AS race_display,
            coalesce(
                cast(ethnicity_display AS varchar),
                'cumulus__none'
            ) AS ethnicity_display,
            coalesce(
                cast(start_month AS varchar),
                'cumulus__none'
            ) AS start_month
        FROM filtered_table
    ),

    powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject_ref,
            "hypertension",
            "hypertension_lab",
            "hypertension_dx",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            "start_month",
            concat_ws(
                '-',
                COALESCE("hypertension",''),
                COALESCE("hypertension_lab",''),
                COALESCE("hypertension_dx",''),
                COALESCE("age_at_visit",''),
                COALESCE("gender",''),
                COALESCE("race_display",''),
                COALESCE("ethnicity_display",''),
                COALESCE("start_month",'')
            ) AS id
        FROM null_replacement
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
        p.cnt_subject_ref AS cnt,
        p."hypertension",
        p."hypertension_lab",
        p."hypertension_dx",
        p."age_at_visit",
        p."gender",
        p."race_display",
        p."ethnicity_display",
        p."start_month"
    FROM powerset AS p
    WHERE 
        cnt_subject_ref >= 10
);

-- ###########################################################

CREATE TABLE htn__count_prevalence_week AS (
    WITH
    filtered_table AS (
        SELECT
            s.subject_ref,
            --noqa: disable=RF03, AL02
            s."hypertension",
            s."hypertension_lab",
            s."hypertension_dx",
            s."age_at_visit",
            s."gender",
            s."race_display",
            s."ethnicity_display",
            s."start_week"
            --noqa: enable=RF03, AL02
        FROM htn__prevalence AS s
    ),
    
    null_replacement AS (
        SELECT
            subject_ref,
            coalesce(
                cast(hypertension AS varchar),
                'cumulus__none'
            ) AS hypertension,
            coalesce(
                cast(hypertension_lab AS varchar),
                'cumulus__none'
            ) AS hypertension_lab,
            coalesce(
                cast(hypertension_dx AS varchar),
                'cumulus__none'
            ) AS hypertension_dx,
            coalesce(
                cast(age_at_visit AS varchar),
                'cumulus__none'
            ) AS age_at_visit,
            coalesce(
                cast(gender AS varchar),
                'cumulus__none'
            ) AS gender,
            coalesce(
                cast(race_display AS varchar),
                'cumulus__none'
            ) AS race_display,
            coalesce(
                cast(ethnicity_display AS varchar),
                'cumulus__none'
            ) AS ethnicity_display,
            coalesce(
                cast(start_week AS varchar),
                'cumulus__none'
            ) AS start_week
        FROM filtered_table
    ),

    powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject_ref,
            "hypertension",
            "hypertension_lab",
            "hypertension_dx",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            "start_week",
            concat_ws(
                '-',
                COALESCE("hypertension",''),
                COALESCE("hypertension_lab",''),
                COALESCE("hypertension_dx",''),
                COALESCE("age_at_visit",''),
                COALESCE("gender",''),
                COALESCE("race_display",''),
                COALESCE("ethnicity_display",''),
                COALESCE("start_week",'')
            ) AS id
        FROM null_replacement
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
        p.cnt_subject_ref AS cnt,
        p."hypertension",
        p."hypertension_lab",
        p."hypertension_dx",
        p."age_at_visit",
        p."gender",
        p."race_display",
        p."ethnicity_display",
        p."start_week"
    FROM powerset AS p
    WHERE 
        cnt_subject_ref >= 10
);

-- ###########################################################

CREATE TABLE htn__count_comorbidity AS (
    WITH
    filtered_table AS (
        SELECT
            s.subject_ref,
            --noqa: disable=RF03, AL02
            s."comorbidity_category_display",
            s."comorbidity_system_display",
            s."comorbidity_display",
            s."gender",
            s."race_display",
            s."ethnicity_display"
            --noqa: enable=RF03, AL02
        FROM htn__comorbidity AS s
    ),
    
    null_replacement AS (
        SELECT
            subject_ref,
            coalesce(
                cast(comorbidity_category_display AS varchar),
                'cumulus__none'
            ) AS comorbidity_category_display,
            coalesce(
                cast(comorbidity_system_display AS varchar),
                'cumulus__none'
            ) AS comorbidity_system_display,
            coalesce(
                cast(comorbidity_display AS varchar),
                'cumulus__none'
            ) AS comorbidity_display,
            coalesce(
                cast(gender AS varchar),
                'cumulus__none'
            ) AS gender,
            coalesce(
                cast(race_display AS varchar),
                'cumulus__none'
            ) AS race_display,
            coalesce(
                cast(ethnicity_display AS varchar),
                'cumulus__none'
            ) AS ethnicity_display
        FROM filtered_table
    ),

    powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject_ref,
            "comorbidity_category_display",
            "comorbidity_system_display",
            "comorbidity_display",
            "gender",
            "race_display",
            "ethnicity_display",
            concat_ws(
                '-',
                COALESCE("comorbidity_category_display",''),
                COALESCE("comorbidity_system_display",''),
                COALESCE("comorbidity_display",''),
                COALESCE("gender",''),
                COALESCE("race_display",''),
                COALESCE("ethnicity_display",'')
            ) AS id
        FROM null_replacement
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
        p.cnt_subject_ref AS cnt,
        p."comorbidity_category_display",
        p."comorbidity_system_display",
        p."comorbidity_display",
        p."gender",
        p."race_display",
        p."ethnicity_display"
    FROM powerset AS p
    WHERE 
        cnt_subject_ref >= 10
);

-- ###########################################################

CREATE TABLE htn__count_comorbidity_month AS (
    WITH
    filtered_table AS (
        SELECT
            s.subject_ref,
            --noqa: disable=RF03, AL02
            s."comorbidity_category_display",
            s."comorbidity_system_display",
            s."comorbidity_display",
            s."gender",
            s."race_display",
            s."ethnicity_display",
            s."comorbidity_month"
            --noqa: enable=RF03, AL02
        FROM htn__comorbidity AS s
    ),
    
    null_replacement AS (
        SELECT
            subject_ref,
            coalesce(
                cast(comorbidity_category_display AS varchar),
                'cumulus__none'
            ) AS comorbidity_category_display,
            coalesce(
                cast(comorbidity_system_display AS varchar),
                'cumulus__none'
            ) AS comorbidity_system_display,
            coalesce(
                cast(comorbidity_display AS varchar),
                'cumulus__none'
            ) AS comorbidity_display,
            coalesce(
                cast(gender AS varchar),
                'cumulus__none'
            ) AS gender,
            coalesce(
                cast(race_display AS varchar),
                'cumulus__none'
            ) AS race_display,
            coalesce(
                cast(ethnicity_display AS varchar),
                'cumulus__none'
            ) AS ethnicity_display,
            coalesce(
                cast(comorbidity_month AS varchar),
                'cumulus__none'
            ) AS comorbidity_month
        FROM filtered_table
    ),

    powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject_ref,
            "comorbidity_category_display",
            "comorbidity_system_display",
            "comorbidity_display",
            "gender",
            "race_display",
            "ethnicity_display",
            "comorbidity_month",
            concat_ws(
                '-',
                COALESCE("comorbidity_category_display",''),
                COALESCE("comorbidity_system_display",''),
                COALESCE("comorbidity_display",''),
                COALESCE("gender",''),
                COALESCE("race_display",''),
                COALESCE("ethnicity_display",''),
                COALESCE("comorbidity_month",'')
            ) AS id
        FROM null_replacement
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
        p.cnt_subject_ref AS cnt,
        p."comorbidity_category_display",
        p."comorbidity_system_display",
        p."comorbidity_display",
        p."gender",
        p."race_display",
        p."ethnicity_display",
        p."comorbidity_month"
    FROM powerset AS p
    WHERE 
        cnt_subject_ref >= 10
);

-- ###########################################################

CREATE TABLE htn__count_comorbidity_week AS (
    WITH
    filtered_table AS (
        SELECT
            s.subject_ref,
            --noqa: disable=RF03, AL02
            s."comorbidity_category_display",
            s."comorbidity_system_display",
            s."comorbidity_display",
            s."gender",
            s."race_display",
            s."ethnicity_display",
            s."comorbidity_week"
            --noqa: enable=RF03, AL02
        FROM htn__comorbidity AS s
    ),
    
    null_replacement AS (
        SELECT
            subject_ref,
            coalesce(
                cast(comorbidity_category_display AS varchar),
                'cumulus__none'
            ) AS comorbidity_category_display,
            coalesce(
                cast(comorbidity_system_display AS varchar),
                'cumulus__none'
            ) AS comorbidity_system_display,
            coalesce(
                cast(comorbidity_display AS varchar),
                'cumulus__none'
            ) AS comorbidity_display,
            coalesce(
                cast(gender AS varchar),
                'cumulus__none'
            ) AS gender,
            coalesce(
                cast(race_display AS varchar),
                'cumulus__none'
            ) AS race_display,
            coalesce(
                cast(ethnicity_display AS varchar),
                'cumulus__none'
            ) AS ethnicity_display,
            coalesce(
                cast(comorbidity_week AS varchar),
                'cumulus__none'
            ) AS comorbidity_week
        FROM filtered_table
    ),

    powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject_ref,
            "comorbidity_category_display",
            "comorbidity_system_display",
            "comorbidity_display",
            "gender",
            "race_display",
            "ethnicity_display",
            "comorbidity_week",
            concat_ws(
                '-',
                COALESCE("comorbidity_category_display",''),
                COALESCE("comorbidity_system_display",''),
                COALESCE("comorbidity_display",''),
                COALESCE("gender",''),
                COALESCE("race_display",''),
                COALESCE("ethnicity_display",''),
                COALESCE("comorbidity_week",'')
            ) AS id
        FROM null_replacement
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
        p.cnt_subject_ref AS cnt,
        p."comorbidity_category_display",
        p."comorbidity_system_display",
        p."comorbidity_display",
        p."gender",
        p."race_display",
        p."ethnicity_display",
        p."comorbidity_week"
    FROM powerset AS p
    WHERE 
        cnt_subject_ref >= 10
);

-- ###########################################################

CREATE TABLE htn__count_comorbidity_period AS (
    WITH
    filtered_table AS (
        SELECT
            s.subject_ref,
            --noqa: disable=RF03, AL02
            s."comorbidity_category_display",
            s."comorbidity_system_display",
            s."comorbidity_display",
            s."enc_class_display",
            s."age_at_visit",
            s."gender",
            s."race_display",
            s."ethnicity_display"
            --noqa: enable=RF03, AL02
        FROM htn__comorbidity_period AS s
    ),
    
    null_replacement AS (
        SELECT
            subject_ref,
            coalesce(
                cast(comorbidity_category_display AS varchar),
                'cumulus__none'
            ) AS comorbidity_category_display,
            coalesce(
                cast(comorbidity_system_display AS varchar),
                'cumulus__none'
            ) AS comorbidity_system_display,
            coalesce(
                cast(comorbidity_display AS varchar),
                'cumulus__none'
            ) AS comorbidity_display,
            coalesce(
                cast(enc_class_display AS varchar),
                'cumulus__none'
            ) AS enc_class_display,
            coalesce(
                cast(age_at_visit AS varchar),
                'cumulus__none'
            ) AS age_at_visit,
            coalesce(
                cast(gender AS varchar),
                'cumulus__none'
            ) AS gender,
            coalesce(
                cast(race_display AS varchar),
                'cumulus__none'
            ) AS race_display,
            coalesce(
                cast(ethnicity_display AS varchar),
                'cumulus__none'
            ) AS ethnicity_display
        FROM filtered_table
    ),

    powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject_ref,
            "comorbidity_category_display",
            "comorbidity_system_display",
            "comorbidity_display",
            "enc_class_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            concat_ws(
                '-',
                COALESCE("comorbidity_category_display",''),
                COALESCE("comorbidity_system_display",''),
                COALESCE("comorbidity_display",''),
                COALESCE("enc_class_display",''),
                COALESCE("age_at_visit",''),
                COALESCE("gender",''),
                COALESCE("race_display",''),
                COALESCE("ethnicity_display",'')
            ) AS id
        FROM null_replacement
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
        p.cnt_subject_ref AS cnt,
        p."comorbidity_category_display",
        p."comorbidity_system_display",
        p."comorbidity_display",
        p."enc_class_display",
        p."age_at_visit",
        p."gender",
        p."race_display",
        p."ethnicity_display"
    FROM powerset AS p
    WHERE 
        cnt_subject_ref >= 10
);

-- ###########################################################

CREATE TABLE htn__count_comorbidity_period_month AS (
    WITH
    filtered_table AS (
        SELECT
            s.subject_ref,
            --noqa: disable=RF03, AL02
            s."comorbidity_category_display",
            s."comorbidity_system_display",
            s."comorbidity_display",
            s."enc_class_display",
            s."age_at_visit",
            s."gender",
            s."race_display",
            s."ethnicity_display",
            s."start_month"
            --noqa: enable=RF03, AL02
        FROM htn__comorbidity_period AS s
    ),
    
    null_replacement AS (
        SELECT
            subject_ref,
            coalesce(
                cast(comorbidity_category_display AS varchar),
                'cumulus__none'
            ) AS comorbidity_category_display,
            coalesce(
                cast(comorbidity_system_display AS varchar),
                'cumulus__none'
            ) AS comorbidity_system_display,
            coalesce(
                cast(comorbidity_display AS varchar),
                'cumulus__none'
            ) AS comorbidity_display,
            coalesce(
                cast(enc_class_display AS varchar),
                'cumulus__none'
            ) AS enc_class_display,
            coalesce(
                cast(age_at_visit AS varchar),
                'cumulus__none'
            ) AS age_at_visit,
            coalesce(
                cast(gender AS varchar),
                'cumulus__none'
            ) AS gender,
            coalesce(
                cast(race_display AS varchar),
                'cumulus__none'
            ) AS race_display,
            coalesce(
                cast(ethnicity_display AS varchar),
                'cumulus__none'
            ) AS ethnicity_display,
            coalesce(
                cast(start_month AS varchar),
                'cumulus__none'
            ) AS start_month
        FROM filtered_table
    ),

    powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject_ref,
            "comorbidity_category_display",
            "comorbidity_system_display",
            "comorbidity_display",
            "enc_class_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            "start_month",
            concat_ws(
                '-',
                COALESCE("comorbidity_category_display",''),
                COALESCE("comorbidity_system_display",''),
                COALESCE("comorbidity_display",''),
                COALESCE("enc_class_display",''),
                COALESCE("age_at_visit",''),
                COALESCE("gender",''),
                COALESCE("race_display",''),
                COALESCE("ethnicity_display",''),
                COALESCE("start_month",'')
            ) AS id
        FROM null_replacement
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
        p.cnt_subject_ref AS cnt,
        p."comorbidity_category_display",
        p."comorbidity_system_display",
        p."comorbidity_display",
        p."enc_class_display",
        p."age_at_visit",
        p."gender",
        p."race_display",
        p."ethnicity_display",
        p."start_month"
    FROM powerset AS p
    WHERE 
        cnt_subject_ref >= 10
);

-- ###########################################################

CREATE TABLE htn__count_comorbidity_period_week AS (
    WITH
    filtered_table AS (
        SELECT
            s.subject_ref,
            --noqa: disable=RF03, AL02
            s."comorbidity_category_display",
            s."comorbidity_system_display",
            s."comorbidity_display",
            s."enc_class_display",
            s."age_at_visit",
            s."gender",
            s."race_display",
            s."ethnicity_display",
            s."start_week"
            --noqa: enable=RF03, AL02
        FROM htn__comorbidity_period AS s
    ),
    
    null_replacement AS (
        SELECT
            subject_ref,
            coalesce(
                cast(comorbidity_category_display AS varchar),
                'cumulus__none'
            ) AS comorbidity_category_display,
            coalesce(
                cast(comorbidity_system_display AS varchar),
                'cumulus__none'
            ) AS comorbidity_system_display,
            coalesce(
                cast(comorbidity_display AS varchar),
                'cumulus__none'
            ) AS comorbidity_display,
            coalesce(
                cast(enc_class_display AS varchar),
                'cumulus__none'
            ) AS enc_class_display,
            coalesce(
                cast(age_at_visit AS varchar),
                'cumulus__none'
            ) AS age_at_visit,
            coalesce(
                cast(gender AS varchar),
                'cumulus__none'
            ) AS gender,
            coalesce(
                cast(race_display AS varchar),
                'cumulus__none'
            ) AS race_display,
            coalesce(
                cast(ethnicity_display AS varchar),
                'cumulus__none'
            ) AS ethnicity_display,
            coalesce(
                cast(start_week AS varchar),
                'cumulus__none'
            ) AS start_week
        FROM filtered_table
    ),

    powerset AS (
        SELECT
            count(DISTINCT subject_ref) AS cnt_subject_ref,
            "comorbidity_category_display",
            "comorbidity_system_display",
            "comorbidity_display",
            "enc_class_display",
            "age_at_visit",
            "gender",
            "race_display",
            "ethnicity_display",
            "start_week",
            concat_ws(
                '-',
                COALESCE("comorbidity_category_display",''),
                COALESCE("comorbidity_system_display",''),
                COALESCE("comorbidity_display",''),
                COALESCE("enc_class_display",''),
                COALESCE("age_at_visit",''),
                COALESCE("gender",''),
                COALESCE("race_display",''),
                COALESCE("ethnicity_display",''),
                COALESCE("start_week",'')
            ) AS id
        FROM null_replacement
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
        p.cnt_subject_ref AS cnt,
        p."comorbidity_category_display",
        p."comorbidity_system_display",
        p."comorbidity_display",
        p."enc_class_display",
        p."age_at_visit",
        p."gender",
        p."race_display",
        p."ethnicity_display",
        p."start_week"
    FROM powerset AS p
    WHERE 
        cnt_subject_ref >= 10
);
