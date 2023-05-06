from itertools import groupby
# Set input and output files
input_file = "input.txt"
output_file = "output.csv"

# Write header row
with open(output_file, "w") as f:
    f.write("row_name,MAE,MFE,r_made\n")

# Loop through input file and extract data
row_data = {}
with open(input_file, "r") as f:
    for line in f:
        # Split line into components
        row_name, column_name, value = line.strip().split(":")
        
        # Store data in dictionary
        row_data[f"{row_name}.{column_name}"] = value.strip()

# Loop through row data and write to output file
with open(output_file, "a") as f:
    for row_name, column_data in groupby(sorted(row_data.items()), key=lambda x: x[0].split(".")[0]):
        # Extract row name and sort data by column name
        row_name = row_name.strip()
        column_data = sorted(column_data, key=lambda x: x[0].split(".")[1])
        
        # Extract values for each column
        mae = next((v for k, v in column_data if "MAE" in k), "0")
        mfe = next((v for k, v in column_data if "MFE" in k), "0")
        r_made = next((v for k, v in column_data if "r_made" in k), "0")
        
        # Write row to output file
        f.write(f"{row_name},{mae},{mfe},{r_made}\n")
