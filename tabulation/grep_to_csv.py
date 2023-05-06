import sys
import csv
from collections import defaultdict
import os

# Create a dictionary to store the row data
data = defaultdict(dict)

for line in sys.stdin:
    # Split the line into row_name, column_name, and value
    try:
        values = line.strip().split(":")
        # disgusting patching for dates in the "created" field
        if values[1] == "created":
            row_name = values[0]
            column_name = values[1]
            value = str(values[2]) + str(values[3]) 
        else:
            row_name, column_name, value = line.strip().split(":")
        value = value[1:] #because propery: value makes the value " value"
    except ValueError as e:
        raise ValueError("line was "+line) from e

    # Add the value to the corresponding row and column
    data[row_name][column_name] = value

# Get the set of all column names
column_names = set()
for row_data in data.values():
    column_names.update(row_data.keys())

# Write the output as a CSV file to standard output
writer = csv.writer(sys.stdout)
# writer.writerow(['file_name'] + sorted(column_names))  # Write header row
# for row_name, row_data in sorted(data.items()):
#     row = [row_name]
#     for column_name in sorted(column_names):
#         row.append(row_data.get(column_name, ''))
#     writer.writerow(row)
# test: remove sorting, does it break stuff?
column_names_list = list(column_names) # to preserve order
writer.writerow(['file_name'] + column_names_list)  # Write header row
for row_name, row_data in data.items():
    row = [row_name]
    for column_name in column_names_list:
        row.append(row_data.get(column_name, ''))
    writer.writerow(row)
