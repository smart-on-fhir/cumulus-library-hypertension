from typing import List
from cumulus_library.schema import counts

STUDY_PREFIX = 'htn'

def table(tablename: str, duration=None) -> str:
    if duration:
        return f'{STUDY_PREFIX}__{tablename}_{duration}'
    else: 
        return f'{STUDY_PREFIX}__{tablename}'

def count_study_period(duration='month'):
    view_name = table('count_study_period', duration)
    from_table = table('study_period')
    cols = [f'start_{duration}',
            'enc_class_display',
            'enc_type_display',
            'age_at_visit',
            'gender',
            'race_display',
            'ethnicity_display']

    return counts.count_encounter(view_name, from_table, cols)

def count_bp(duration=None):
    view_name = table('count_bp', duration)
    from_table = table('bp')
    cols = ['hypertension',
            'hypotension',
            'enc_class_display',
            'enc_type_display',
            'age_at_visit',
            'gender',
            'race_display',
            'ethnicity_display']

    if duration:
        cols.append(f'obs_{duration}')

    return counts.count_patient(view_name, from_table, cols)

def count_dx(duration=None):
    view_name = table('count_dx', duration)
    from_table = table('dx')
    cols = ['category_display',
            'cond_display',
            'cond_system_display']
    if duration:
        cols.append(f'cond_{duration}')

    return counts.count_patient(view_name, from_table, cols)

def count_dx_period(duration=None):
    view_name = table('count_dx_period', duration)
    from_table = table('dx_period')
    cols = ['category_display',
            'cond_display',
            'cond_system_display',
            'enc_class_display',
            'enc_type_display',
            'age_at_visit',
            'gender',
            'race_display',
            'ethnicity_display']

    if duration:
        cols.append(f'cond_{duration}')

    return counts.count_patient(view_name, from_table, cols)

def count_prevalence(duration='month'):
    view_name = table('count_prevalence', duration)
    from_table = table('prevalence')
    cols = ['hypertension',
            'hypertension_lab',
            'hypertension_dx',
            'age_at_visit',
            'gender',
            'race_display',
            'ethnicity_display']

    if duration:
        cols.append(f'start_{duration}')

    return counts.count_patient(view_name, from_table, cols)

def count_rx(duration='month'):
    view_name = table('count_rx', duration)
    from_table = table('rx')
    cols = ['category_code', 'rx_display']

    if duration:
        cols.append(f'authoredon_{duration}')

    return counts.count_patient(view_name, from_table, cols)

def count_procedure(duration=None):
    view_name = table('count_procedure', duration)
    from_table = table('procedure')
    cols = ['enc_class_display', 'proc_display', 'proc_system']

    if duration:
        cols.append(f'enc_start_{duration}')

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
    sql_optimizer = concat_view_sql(view_list_sql)
    sql_optimizer = sql_optimizer.replace("ORDER BY cnt desc", "")
    sql_optimizer = sql_optimizer.replace("CREATE or replace VIEW", 'CREATE TABLE')
    with open(filename, 'w') as fout:
        fout.write(sql_optimizer)


if __name__ == '__main__':
    write_view_sql([
        count_study_period('month'),
        count_study_period('week'),
        count_study_period('date'),

        # FHIR Observation
        count_bp(),
        count_bp('month'),
        count_bp('week'),
        count_bp('date'),

        # FHIR Condition with FHIR Encounter
        count_dx('month'),
        count_dx('week'),
        count_dx('date'),

        # FHIR Condition with FHIR Encounter
        count_dx_period('month'),
        count_dx_period('week'),
        count_dx_period('date'),

        count_prevalence('month'),
        count_prevalence('week'),
    ])
