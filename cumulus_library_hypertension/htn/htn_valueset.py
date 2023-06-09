import os
from typing import List
from cumulus_library.helper import load_json
from fhirclient.models.coding import Coding

def create_view(view_name: str, concept_list: List[Coding]) -> str:
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


def parse_valueset(json_file) -> List[Coding]:
    """
    :param json_file: ValueSet file, espeically those provided by NLM/ONC/VSAC
    :return: list of codeable concepts (system, code, display) to include
    """
    valueset = load_json(os.path.join(pwd(), json_file))

    parsed = list()

    for include in valueset['compose']['include']:
        _system = include['system']
        if 'concept' in include.keys():
            for concept in include['concept']:
                concept['system'] = _system
                parsed.append(Coding(concept))
    return parsed

def pwd(): return os.path.dirname(__file__)


if __name__ == "__main__":
    icd10 = parse_valueset('htn_valueset_dx_icd10.json')
    snomed = parse_valueset('htn_valueset_dx_snomed.json')
    rxnorm = parse_valueset('htn_valueset_rx_rxnorm.json')

    _sql = create_view('htn__define_dx', icd10+snomed)
    print(_sql)

    _sql = create_view('htn__define_rx', rxnorm)
    print(_sql)
