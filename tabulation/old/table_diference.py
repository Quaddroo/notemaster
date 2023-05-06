import pandas as pd

# Load the CSV files into pandas dataframes
df1 = pd.read_csv('s1.csv')
df2 = pd.read_csv('s2.csv')

# Merge the dataframes on the common column(s)
merged = pd.merge(df1, df2, on=['a'], how='outer')

# Debugging statements
# print("Merged dataframe columns:")
# print(merged.columns)
# print("Merged dataframe shape:")
# print(merged.shape)
# print(merged)

# print(merged)

# create a list of columns to compare
# # Find the differences between the two tables
# print(merged.loc[merged['b_x']])
# diff = merged.loc[merged[' b_x'] != merged[ ' b_y'], [ ' b_x', ' c_y']]

# remove leading whitespace from column names
merged.columns = merged.columns.str.strip()

diff = merged.loc[merged['b_x'] != merged[ 'b_y']]

print(diff)
# print(merged)

