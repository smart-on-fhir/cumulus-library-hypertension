from typing import List
from cumulus_library.schema import counts

STUDY_PREFIX = 'htn'

def table(tablename: str, duration=None) -> str:
    if duration:
        return f'{STUDY_PREFIX}__{tablename}_{duration}'
    else: 
        return f'{STUDY_PREFIX}__{tablename}'

def count_bp(duration=None):
    view_name = table('count_bp', duration)
    from_table = table('bp')
    cols = ['hypertension', 'hypotension', 'enc_class_code',
            'gender', 'age_at_visit', 'race_display', 'ethnicity_display',
            'hypertension', 'hypotension']

    if duration:
        cols.append(f'obs_{duration}')

    return counts.count_patient(view_name, from_table, cols)

def count_dx(duration='month'):
    view_name = table('count_dx', duration)
    from_table = table('dx')
    cols = [f'cond_{duration}',
            'enc_class_code',
            'gender', 'age_at_visit', 'race_display', 'ethnicity_display',
            'cond_display', 'cond_system_display']
    return counts.count_patient(view_name, from_table, cols)

def count_rx(duration='month'):
    view_name = table('count_rx', duration)
    from_table = table('rx')
    cols = [f'authoredon_{duration}',
            'category_code', 'rx_display']
    return counts.count_patient(view_name, from_table, cols)

def count_procedure():
    view_name = table('count_procedure')
    from_table = table('procedure')
    cols = ['proc_display', 'proc_system']
    return counts.count_encounter(view_name, from_table, cols)

def concat_view_sql(create_view_list: List[str]) -> str:
    """
    :param create_view_list: SQL prepared statements
    """
    seperator = '-- ###########################################################'
    concat = list()

    for create_view in create_view_list:
        concat.append(seperator + '\n'+create_view + '\n')

    return '\n'.join(concat)

def write_view_sql(view_list_sql: List[str], filename='count.sql') -> None:
    """
    :param view_list_sql: SQL prepared statements
    :param filename: path to output file, default 'count.sql' in PWD
    """
    with open(filename, 'w') as fout:
        fout.write(concat_view_sql(view_list_sql))


if __name__ == '__main__':
    write_view_sql([
        count_bp(),
        count_bp('month'),
        count_dx('month'),
        # count_rx('month'), TODO requires support for FHIR MedicationRequest
        # count_procedure()  TODO requires support for FHIR Procedure
    ])
