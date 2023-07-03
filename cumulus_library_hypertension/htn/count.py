from typing import List
from cumulus_library.schema import counts

STUDY_PREFIX = 'htn'

def table(tablename: str, duration=None) -> str:
    if duration:
        return f'{STUDY_PREFIX}__{tablename}_{duration}'
    else: 
        return f'{STUDY_PREFIX}__{tablename}'

def count_bp_eval(duration='month'):
    view_name = table('count_bp_eval', duration)
    from_table = table('bp_eval')
    cols = [f'obs_{duration}',
            'systolic_high', 'systolic_low',
            'diastolic_high', 'diastolic_low']

    return counts.count_encounter(view_name, from_table, cols)

def count_bp(duration='month'):
    view_name = table('count_bp', duration)
    from_table = table('bp')
    cols = [f'obs_{duration}',
            'enc_class_code',
            'gender',
            'age_at_visit',
            'systolic_high', 'systolic_low',
            'diastolic_high', 'diastolic_low']

    return counts.count_encounter(view_name, from_table, cols)

def concat_view_sql(create_view_list: List[str]) -> str:
    """
    :param create_view_list: SQL prepared statements
    :param filename: path to output file, default 'count.sql' in PWD
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
        count_bp_eval('month'),
        count_bp('month'),
    ])
