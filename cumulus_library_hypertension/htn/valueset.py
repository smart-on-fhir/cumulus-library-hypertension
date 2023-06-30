import os
from typing import List
from cumulus_library.helper import load_json
from fhirclient.models.coding import Coding

def get_path(filename=None):
    if filename:
        return os.path.join(os.path.dirname(__file__), filename)
    else:
        return os.path.dirname(__file__)

def valueset2coding(valueset_json) -> List[Coding]:
    """
    Obtain a list of Coding "concepts" from a ValueSet.
    This method currently supports only "include" of "concept" defined fields.
    Not supported: recursive fetching of contained ValueSets, which requires UMLS API Key and Wget, etc.

    examples
    https://vsac.nlm.nih.gov/valueset/2.16.840.1.113762.1.4.1146.1629/expansion/Latest
    https://cts.nlm.nih.gov/fhir/res/ValueSet/2.16.840.1.113762.1.4.1146.1629?_format=json

    :param valueset_json: ValueSet file, expecially those provided by NLM/ONC/VSAC
    :return: list of codeable concepts (system, code, display) to include
    """
    filepath = get_path(valueset_json)
    print(f'\nvalueset:{filepath}')

    valueset = load_json(get_path(valueset_json))
    parsed = list()

    for include in valueset['compose']['include']:
        if 'concept' in include.keys():
            for concept in include['concept']:
                concept['system'] = include['system']
                parsed.append(Coding(concept))
    return parsed

def escape(sql: str) -> str:
    """
    :param sql: SQL potentially containing special chars
    :return: special chars removed like tic(') and semi(;).
    """
    return sql.replace("'", "").replace(";", ".")

def coding2view(view_name: str, concept_list: List[Coding]) -> str:
    """
    :param view_name: like define_type
    :param concept_list: list of concepts to include in definition
    :return: SQL command
    """
    prefix = 'htn'
    header = f"create or replace view {prefix}__{view_name} as select * from (values"
    footer = ") AS t (system, code, display) ;"
    content = list()
    for concept in concept_list:
        safe_display = escape(concept.display)
        content.append(f"('{concept.system}', '{concept.code}', '{safe_display}')")
    content = '\n,'.join(content)
    return header + '\n' + content + '\n' + footer

def save(view_name: str, view_sql: str, outfile=None) -> str:
    """
    :param view_name: create view as
    :param view_sql: SQL commands
    :param outfile: default view_name.sql
    :return: outfile path
    """
    if not outfile:
        outfile = get_path(f'{view_name}.sql')
    print(f'\nsave({view_name})')
    print(f'{outfile}\n')
    with open(outfile, 'w') as fp:
        fp.write(view_sql)
    return outfile

def define(view_name: str, fileset_json: List[str]) -> str:
    """
    :param view_name: create view as
    :param fileset_json: VSAC ValueSet JSON files
    :return: outfile path
    """
    codings = list()
    for filename in fileset_json:
        codings += valueset2coding(filename)

    return save(view_name, coding2view(view_name, codings))

def define_dx():
    define('define_dx',
           ['valueset_dx_icd10_ncqa.json', 'valueset_dx_snomed_ncqa.json'])

    define('define_dx_essential',
           ['valueset_dx_essential_icd10_ncqa.json', 'valueset_dx_essential_snomed_ncqa.json'])

    define('define_dx_existing',
           ['valueset_dx_preexisting_icd10.json', 'valueset_dx_preexisting_snomed.json'])

def define_rx():
    define('define_rx',
           ['valueset_rx_antihypertensive_rxnorm_aha.json'])

def define_enc():
    define('define_enc_office',
           ['valueset_enc_office_cpt_ncqa.json'])

    define('define_enc_home',
           ['valueset_enc_home_cpt_ncqa.json'])

    define('define_enc_preventive',
           ['valueset_enc_preventive_established_cpt_ncqa.json',
            'valueset_enc_preventive_initial_cpt_ncqa.json'])

    define('define_enc_wellness',
           ['valueset_enc_wellness_cpt_ncqa.json',
            'valueset_enc_wellness_hcpcs_ncqa.json'])

    define('define_enc_inpatient',
           ['valueset_enc_inpatient_acute_cpt_ncqa.json',
            'valueset_enc_inpatient_acute_snomed_acep.json',
            'valueset_enc_inpatient_acute_snomed_ncqa.json'])

    define('define_enc_hospice',
           ['valueset_enc_hospice_hcpcs.json',
            'valueset_enc_hospice_hcpcs_ncqa.json'])

    define('define_enc_nursing',
           ['valueset_enc_nursing_cpt_ncqa.json'])

    define('define_enc_palliative',
           ['valueset_enc_palliative_hcpcs_ncqa.json',
            'valueset_enc_palliative_snomed_ncqa.json'])

def define_frailty():
    define('define_frailty',
           ['valueset_frailty_diagnosis_icd10_ncqa.json',
            'valueset_frailty_symptom_icd10_ncqa.json',
            'valueset_frailty_snomed_ncqa.json',
            'valueset_frailty_cpt_ncqa.json',
            'valueset_frailty_hcpcs_ncqa.json',
            'valueset_advanced_illness_icd10_ncqa.json',
            'valueset_advanced_illness_snomed_ncqa.json'])

def define_esrd():
    define('define_esrd',
           ['valueset_esrd_diagnosis_icd10_ncqa.json',
            'valueset_esrd_diagnosis_snomed_ncqa.json',
            'valueset_esrd_documented_hcpcs.json',
            'valueset_esrd_transplant_snomed_ncqa.json',
            'valueset_esrd_transplant_icd10cm_ncqa.json',
            'valueset_esrd_transplant_icd10pcs_ncqa.json'])

def define_vaccine():
    define('define_vaccine',
           ['valueset_vaccine_cvx_cste.json',
            'valueset_vaccine_cvx_hl7.json',
            'valueset_vaccine_rxnorm_cste.json',
            'valueset_vaccine_rxnorm_hl7.json'])


if __name__ == "__main__":
    define_dx()
    define_rx()
    define_enc()
    define_frailty()
    define_esrd()
