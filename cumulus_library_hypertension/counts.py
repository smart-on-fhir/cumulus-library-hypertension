import cumulus_library
import pathlib


class HtnCountsBuilder(cumulus_library.CountsBuilder):
    display_text = "Creating htn counts..."

    def __init__(self):
        super().__init__()

    def count_study_period(self, duration=None):
        view_name = self.get_table_name('count_study_period', duration)
        from_table = self.get_table_name('study_period')
        cols = ['enc_class_display',
                'enc_type_display',
                'age_at_visit',
                'gender',
                'race_display',
                'ethnicity_display']

        if duration:
            cols.append(f'start_{duration}')

        return self.count_encounter(view_name, from_table, cols)

    def count_bp(self, duration=None):
        view_name = self.get_table_name('count_bp', duration)
        from_table = self.get_table_name('bp')
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

        return self.count_patient(view_name, from_table, cols)

    def count_dx(self, duration=None):
        view_name = self.get_table_name('count_dx', duration)
        from_table = self.get_table_name('dx')
        cols = ['category_display',
                'cond_display',
                'cond_system_display']

        if duration:
            cols.append(f'cond_{duration}')

        return self.count_patient(view_name, from_table, cols)

    def count_dx_period(self, duration=None):
        view_name = self.get_table_name('count_dx_period', duration)
        from_table = self.get_table_name('dx_period')
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

        return self.count_patient(view_name, from_table, cols)

    def count_prevalence(self, duration='month'):
        view_name = self.get_table_name('count_prevalence', duration)
        from_table = self.get_table_name('prevalence')
        cols = ['hypertension',
                'hypertension_lab',
                'hypertension_dx',
                'age_at_visit',
                'gender',
                'race_display',
                'ethnicity_display']

        if duration:
            cols.append(f'start_{duration}')

        return self.count_patient(view_name, from_table, cols)

    def count_comorbidity(self, duration=None):
        view_name = self.get_table_name('count_comorbidity', duration)
        from_table = self.get_table_name('comorbidity')
        cols = ['comorbidity_category_display',
                'comorbidity_system_display',
                'comorbidity_display',
                'gender',
                'race_display',
                'ethnicity_display']

        if duration:
            cols.append(f'comorbidity_{duration}')

        return self.count_patient(view_name, from_table, cols)

    def count_comorbidity_period(self, duration=None):
        view_name = self.get_table_name('count_comorbidity_period', duration)
        from_table = self.get_table_name('comorbidity_period')
        cols = ['comorbidity_category_display',
                'comorbidity_system_display',
                'comorbidity_display',
                'enc_class_display',
                'age_at_visit',
                'gender',
                'race_display',
                'ethnicity_display']

        if duration:
            cols.append(f'start_{duration}')

        return self.count_patient(view_name, from_table, cols)

    def count_rx(self, duration='month'):
        view_name = self.get_table_name('count_rx', duration)
        from_table = self.get_table_name('rx')
        cols = ['category_code', 'rx_display']

        if duration:
            cols.append(f'authoredon_{duration}')

        return self.count_patient(view_name, from_table, cols)

    def count_procedure(self, duration=None):
        view_name = self.get_table_name('count_procedure', duration)
        from_table = self.get_table_name('procedure')
        cols = ['enc_class_display', 'proc_display', 'proc_system']

        if duration:
            cols.append(f'enc_start_{duration}')

        return self.count_encounter(view_name, from_table, cols)

    def prepare_queries(self, *args, **kwargs):
        self.queries =[
            self.count_study_period(),
            self.count_study_period('month'),
            self.count_study_period('week'),

            # FHIR Observation
            self.count_bp(),
            self.count_bp('month'),
            self.count_bp('week'),
            self.count_bp('date'),

            # FHIR Condition with FHIR Encounter
            self.count_dx('month'),
            self.count_dx('week'),
            self.count_dx('date'),

            # FHIR Condition with FHIR Encounter
            self.count_dx_period('month'),
            self.count_dx_period('week'),
            self.count_dx_period('date'),

            self.count_prevalence('month'),
            self.count_prevalence('week'),

            self.count_comorbidity(),
            self.count_comorbidity('month'),
            self.count_comorbidity('week'),

            self.count_comorbidity_period(),
            self.count_comorbidity_period('month'),
            self.count_comorbidity_period('week'),
        ]


if __name__ == "__main__":
    builder = HtnCountsBuilder()
    builder.write_counts(f"{pathlib.Path(__file__).resolve().parent}/counts.sql")
