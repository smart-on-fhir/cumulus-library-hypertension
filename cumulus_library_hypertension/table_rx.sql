-- NOTICE:
-- The SQL below is a
-- workaround for accessing "core__medicationrequest" still a work in progress
--
-- https://github.com/smart-on-fhir/cumulus-library/issues/61
-- https://github.com/smart-on-fhir/cumulus-library/issues/67

create table htn__rx as
SELECT DISTINCT
    cat_coding.code as category_code,
    rx.code AS rx_code,
    rx.display as rx_display,
    mr.authoredon,
    mr.authoredon_month,
    concat('Patient/', mr.subject_id) as subject_ref
FROM
    htn__define_rx AS rx,
    core__medicationrequest AS mr,
    unnest(mr.category) AS t (mr_cat),
    unnest(mr_cat.coding) AS t (cat_coding)
WHERE
    rx.code = mr.code and
    rx.system = mr.system
;


