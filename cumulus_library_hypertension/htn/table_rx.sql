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
    mr.authoredon as authoredon_date,
    mr.authoredon_month,
    orig.subject.reference as subject_ref,
    orig.encounter.reference as encounter_ref
FROM
    htn__define_rx AS rx,
    core__medicationrequest AS mr,
    medicationrequest as orig,
    unnest(mr.category) AS t (mr_cat),
    unnest(mr_cat.coding) AS t (cat_coding)
WHERE
    rx.code = mr.code and
    rx.system = mr.system and
    mr.med_admin_id = orig.id
;

create table htn__prevalence_rx as
select distinct
    coalesce(htn__rx.category_code, 'None') as rx_category_code,
    coalesce(htn__rx.rx_code, 'None') as rx_code,
    coalesce(htn__rx.rx_display, 'None') as rx_display,
    htn__study_period.*
from
    htn__study_period as htn__study_period
left join htn__rx on htn__study_period.encounter_ref = htn__rx.encounter_ref
;



