import os
import json
from typing import List

from fhirclient.models.coding import Coding

def path_valueset(valueset_json: str) -> str:
    return os.path.join(os.path.dirname(__file__), valueset_json)

def path_sql(view_name: str) -> str:
    return os.path.join(os.path.dirname(__file__), f'{view_name}.sql')

def load_valueset(filepath: str) -> dict:
    print(f'\nload valueset:{filepath}')
    with open(filepath, "r", encoding="UTF-8") as fp:
        return json.load(fp)

def save_sql(filepath, view_sql: str) -> str:
    """
    :param view_name: create view as
    :param view_sql: SQL commands
    :param outfile: default view_name.sql
    :return: outfile path
    """
    with open(filepath, 'w') as fp:
        fp.write(view_sql)
    return filepath

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
    valueset = load_valueset(valueset_json)
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


def define(view_name: str, fileset_json: List[str]) -> str:
    """
    :param view_name: create view as
    :param fileset_json: VSAC ValueSet JSON files
    :return: outfile path
    """
    codings = list()
    for filename in fileset_json:
        codings += valueset2coding(path_valueset(filename))

    return save_sql(path_sql(view_name), coding2view(view_name, codings))

def define_dx():
    define('define_dx',
           ['valueset_dx_icd10_ncqa.json', 'valueset_dx_snomed_ncqa.json'])

    define('define_dx_essential',
           ['valueset_dx_essential_icd10_ncqa.json', 'valueset_dx_essential_snomed_ncqa.json'])

    define('define_dx_existing',
           ['valueset_dx_preexisting_icd10.json', 'valueset_dx_preexisting_snomed.json'])

def define_rx_include():
    define('define_rx',
           ['valueset_rx_rxnorm_aha.json'])

def define_rx_exclude():
    define('define_rx_exclude',
           ['valueset_dementia_rx_rxnorm_aan.json',
            'valueset_dementia_rx_rxnorm_ncqa.json'])


def define_enc_include():
    """
    Outpatient type facilities, not ED Visit or Inpatient/Nursing/etc
    """
    define('define_enc_outpatient',
           ['valueset_enc_outpatient_cpt_ncqa.json',
            'valueset_enc_outpatient_hcpcs_ncqa.json',
            'valueset_enc_outpatient_snomed_ncqa.json'])

    define('define_enc_office',
           ['valueset_enc_office_cpt_ncqa.json',
            'valueset_enc_office_snomed_ncqa.json'])

    define('define_enc_home',
           ['valueset_enc_home_snomed_ncqa.json',
            'valueset_enc_home_cpt_ncqa.json'])

    define('define_enc_preventive',
           ['valueset_enc_preventive_established_cpt_ncqa.json',
            'valueset_enc_preventive_initial_cpt_ncqa.json'])

    define('define_enc_wellness',
           ['valueset_enc_wellness_cpt_ncqa.json',
            'valueset_enc_wellness_hcpcs_ncqa.json'])

    define('define_enc_telemed',
           ['valueset_enc_telemed_cpt_ncqa.json',
            'valueset_enc_telemed_snomed_ncqa.json'])


def define_enc_exclude():
    """
    :return:
    """
    define('define_enc_edvisit',
           ['valueset_enc_edvisit_cpt_ncqa.json',
            'valueset_enc_edvisit_snomed_ncqa.json'])

    define('define_enc_observation',
           ['valueset_enc_observation_cpt_ncqa.json',
            'valueset_enc_observation_snomed_tjc.json'])

    define('define_enc_icu',
           ['valueset_enc_icu_snomed_cdc.json',
            'valueset_enc_icu_snomed_tjc.json'])

    define('define_enc_inpatient',
           ['valueset_enc_inpatient_acute_cpt_ncqa.json',
            'valueset_enc_inpatient_acute_snomed_acep.json',
            'valueset_enc_inpatient_acute_snomed_ncqa.json',
            'valueset_enc_inpatient_non_acute_cpt_ncqa.json',
            'valueset_enc_inpatient_non_acute_snomed_ncqa.json'])

    define('define_enc_nursing',
           ['valueset_enc_nursing_cpt_ncqa.json'])

    define('define_enc_hospice',
           ['valueset_enc_hospice_hcpcs.json',
            'valueset_enc_hospice_hcpcs_ncqa.json'])

    define('define_enc_palliative',
           ['valueset_enc_palliative_hcpcs_ncqa.json',
            'valueset_enc_palliative_snomed_ncqa.json'])

def define_pregnancy():
    define('define_pregnancy',
           ['valueset_pregnancy_dx_icd10_aha.json',
            'valueset_pregnancy_dx_snomed_aha.json'])

def define_frailty():
    define('define_frailty',
           ['valueset_frailty_device_snomed_ncqa.json',
            'valueset_frailty_dx_icd10_ncqa.json',
            'valueset_frailty_dx_snomed_ncqa.json',
            'valueset_frailty_enc_snomed_ncqa.json',
            'valueset_frailty_enc_cpt_ncqa.json',
            'valueset_frailty_enc_hcpcs_ncqa.json',
            'valueset_frailty_symptom_snomed_ncqa.json',
            'valueset_frailty_symptom_icd10_ncqa.json'])

def define_advanced_illness():
    define('define_advanced_illness',
           ['valueset_advanced_illness_icd10_ncqa.json',
            'valueset_advanced_illness_snomed_ncqa.json'])

def define_esrd():
    define('define_esrd',
           ['valueset_esrd_dx_icd10_ncqa.json',
            'valueset_esrd_dx_snomed_ncqa.json',
            'valueset_esrd_documented_hcpcs.json',
            'valueset_esrd_dialysis_cpt_ncqa.json',
            'valueset_esrd_dialysis_hcpcs_ncqa.json',
            'valueset_esrd_dialysis_snomed_ncqa.json',
            'valueset_esrd_transplant_snomed_ncqa.json',
            'valueset_esrd_transplant_icd10cm_ncqa.json',
            'valueset_esrd_transplant_icd10pcs_ncqa.json'])


def define_vaccine():
    """
    Common example of an outpatient procedure useful for testing.
    """
    define('define_vaccine',
           ['valueset_vaccine_cvx_cste.json',
            'valueset_vaccine_cvx_hl7.json',
            'valueset_vaccine_rxnorm_cste.json',
            'valueset_vaccine_rxnorm_hl7.json'])


if __name__ == "__main__":
    define_dx()
    define_rx_include()
    define_rx_exclude()
    define_enc_include()
    define_enc_exclude()
    define_pregnancy()
    define_esrd()
    define_advanced_illness()
    define_frailty()
