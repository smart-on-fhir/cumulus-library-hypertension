import os
from typing import List
from cumulus_library.helper import load_json
from fhirclient.models.coding import Coding

def include_coding(valueset_json) -> List[Coding]:
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
    valueset = load_json(get_path(valueset_json))
    parsed = list()

    for include in valueset['compose']['include']:
        if 'concept' in include.keys():
            for concept in include['concept']:
                concept['system'] = include['system']
                parsed.append(Coding(concept))
    return parsed

def create_view_sql(view_name: str, concept_list: List[Coding]) -> str:
    """
    :param view_name: like study__define_type
    :param concept_list: list of concepts to include in definition
    :return: sql statement to execute
    """
    header = f"create or replace view {view_name} as select * from (values"
    footer = ") AS t (system, code, display) ;"
    content = list()
    for concept in concept_list:
        content.append(f"('{concept.system}', '{concept.code}', '{concept.display}')")
    content = '\n,'.join(content)
    return header + '\n' + content + '\n' + footer

def write_view_sql(view_name: str, concept_list: List[Coding]) -> None:
    with open(get_path(f'{view_name}.sql'), 'w') as fp:
        fp.write(create_view_sql(view_name, concept_list))

def get_path(filename=None):
    if filename:
        return os.path.join(os.path.dirname(__file__), filename)
    else:
        return os.path.dirname(__file__)


if __name__ == "__main__":
    diagnosis = include_coding('htn_valueset_dx_icd10.json') + \
                include_coding('htn_valueset_dx_snomed.json')

    medication = include_coding('htn_valueset_rx_rxnorm.json')

    vaccine = include_coding('core_valueset_vaccine_cvx_cste.json') +\
              include_coding('core_valueset_vaccine_rxnorm_cste.json') + \
              include_coding('core_valueset_vaccine_rxnorm_hl7.json')

    frailty = include_coding('htn_valueset_frailty_cpt_ncqa.json') + \
              include_coding('htn_valueset_frailty_icd10_ncqa.json') + \
              include_coding('htn_valueset_frailty_hcpcs_ncqa.json') + \
              include_coding('htn_valueset_frailty_snomed_ncqa.json')

    write_view_sql('htn__define_dx', diagnosis)
    write_view_sql('htn__define_rx', medication)
    write_view_sql('htn__define_vaccine', vaccine)
    write_view_sql('htn__define_frailty', frailty)
