create table htn__procedure AS
WITH join_coding as
(
    select id, proc_coding
    from "procedure",
    unnest (code.coding) as t(proc_coding)
),
procedure_encounter as
(
    select
    P.*,
    E.enc_class,
    E.start_week,
    E.start_month,
    E.start_year
    from "procedure" as P, core__encounter as E
    where P.encounter.reference = E.encounter_ref
)
select
    coalesce(proc_coding.system, 'None') as proc_system,
    coalesce(proc_coding.code, 'None') as proc_code,
    coalesce(proc_coding.display, 'None') as proc_display,
    PE.performeddatetime,
    PE.enc_class,
    PE.enc_class.code as enc_class_code,
    PE.enc_class.display as enc_class_display,
    PE.start_week  as enc_start_week,
    PE.start_month as enc_start_month,
    PE.start_year  as enc_start_year,
    PE.status,
    PE.subject.reference as subject_ref,
    PE.encounter.reference as encounter_ref,
    concat('Procedure/', PE.id) as procedure_ref,
    PE.id as procedure_id
from        procedure_encounter   as PE
left join   join_coding on PE.id = join_coding.id;


