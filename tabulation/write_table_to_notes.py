import pandas as pd
import os
from pathlib import Path

note_folder = Path('note_folder').read_text().replace('\n', '')

naming_column = 'file_name' # name of the column against which the tables are matched

# Read the CSV files
try:
    df1 = pd.read_csv('snapshot.csv', dtype=str)
    df2 = pd.read_csv('desire.csv', dtype=str)
except FileNotFoundError as e:
    if os.getcwd() == note_folder:
        df1 = pd.read_csv('tabulation/snapshot.csv', dtype=str)
        df2 = pd.read_csv('tabulation/desire.csv', dtype=str)
    else:
        print("CWD WAS:")
        print(os.getcwd())
        raise e


# Merge the two dataframes with respect to the file name
merged = pd.merge(df1, df2, on=[naming_column], how='outer')
merged.columns = merged.columns.str.strip()

# Get a list of column names
columns = list(merged.columns)
merged = merged.fillna('') # because pandas draws NaN wherever there is no value
differences = []

for column in columns:
    if (not column.endswith('_x') ) and (not column.endswith('_y') ) and (not column == naming_column):
        raise ValueError(f"{column} was fully new, but should only add columns starting with extraction not to miss any existing values")

for column in columns:
    if column.endswith('_x'):
        # Compare columns with the same name but with '_x' and '_y' suffixes
        column_x = column
        original_column_name = column_x[0:-2]
        column_y = column_x.replace('_x', '_y')
        diff = merged.loc[merged[column_x] != merged[column_y]]
        for index, row in diff.iterrows():
            if row[column_x] == "":
                # check if there is no value at all in the file (needs to be added) or the value is present but empty:
                value_present = os.popen(f"grep -P -m 1 '^{original_column_name}:' \"{row['file_name']}\"").read()
                value_present = value_present.replace('\n', '')
                there_was_no_value = value_present == ""
                if there_was_no_value:
                    print(f"{original_column_name} needs to added with value {row[column_y]} at file: {row['file_name']}")
                    os.system(f"sed -i '1 i\\{original_column_name}: {row[column_y]}' \"{row['file_name']}\"")
                    print("done")
                else:
                    print(f"{original_column_name} needs to be changed from {value_present} to {row[column_y]} at file: {row['file_name']}")
                    os.system(f"sed -i 's/{value_present}/{original_column_name}: {row[column_y]}/' \"{row['file_name']}\"")
                    print("done")
            else:
                print(f"{original_column_name} needs to be updated from {row[column_x]} to {row[column_y]} at file: {row['file_name']}")
                os.system(f"sed -i 's/{original_column_name}: {row[column_x]}/{original_column_name}: {row[column_y]}/' \"{row['file_name']}\"")
                print("done")

