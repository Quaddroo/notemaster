import csv

filename = input("Enter CSV filename: ")
with open(filename, 'r') as csv_file:
    reader = csv.reader(csv_file)
    data = {}
    headers = []
    for i, row in enumerate(reader):
        if i == 0:
            headers = row[1:]
            continue
        row_name = row[0]
        for j, val in enumerate(row[1:]):
            column_name = headers[j]
            key = f"{row_name}:{column_name}"
            data[key] = val

for key, val in sorted(data.items()):
    row_name, column_name = key.split('.')
    print(f"{key}: {val}")
