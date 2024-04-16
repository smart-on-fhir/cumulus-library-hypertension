"""Unit tests"""

import glob
import os
import tempfile
import unittest

import ddt
import duckdb

from cumulus_library import cli


@ddt.ddt
class HypertensionTestCase(unittest.TestCase):
    """Test case for the hypertension study writ large."""

    def setUp(self):
        super().setUp()
        self.maxDiff = None

    def test_happy_path(self) -> None:
        """Runs the study on some input data and spot-checks the results"""
        test_dir = os.path.dirname(__file__)
        root_dir = os.path.dirname(test_dir)
        data_dir = f"{test_dir}/data/basic"
        study_dir = f"{root_dir}/cumulus_library_hypertension/htn"

        # OK which tables are we going to compare in this test?
        expected_result_paths = sorted(glob.glob(f"{data_dir}/expected*.csv"))
        expected_names = [
            path.removeprefix(f"{data_dir}/expected").removesuffix(".csv")
            for path in expected_result_paths
        ]
        expected_tables = {name: f"htn_{name}" for name in expected_names}

        # Set up and run the study!
        with tempfile.TemporaryDirectory() as tmpdir:
            cli.main(
                [
                    "build",
                    # "--verbose",
                    "--target=core",
                    "--target=htn",
                    f"--study-dir={study_dir}",
                    "--db-type=duckdb",
                    f"--database={tmpdir}/duck.db",
                    f"--load-ndjson-dir={data_dir}",
                ]
            )
            db = duckdb.connect(f"{tmpdir}/duck.db")

            # Uncomment this for extra debugging
            # df = db.execute("select * from htn__count_prevalence_month").df()
            # print(df.to_string())

            # Check each output with the saved & expected version
            for short_name, full_name in expected_tables.items():
                csv_path = f"{tmpdir}/{full_name}.csv"
                db_table = db.table(full_name)
                sorted_table = db_table.order(f"ALL DESC NULLS FIRST")
                sorted_table.to_csv(csv_path)
                with open(csv_path, "r", encoding="utf8") as f:
                    csv = f.read()

                expected_path = f"{data_dir}/expected{short_name}.csv"
                with open(expected_path, "r", encoding="utf8") as f:
                    expected_lines = f.readlines()
                    # To allow for comments in expected files, strip them out here
                    expected = ''.join(line for line in expected_lines if not line.startswith("#"))

                explanation = f"{short_name}:\n{csv}"
                self.assertEqual(expected, csv, explanation)
