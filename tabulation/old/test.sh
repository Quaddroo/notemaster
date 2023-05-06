#!/bin/bash

# Set input and output files
input_file="input.txt"
output_file="output.csv"

# Write header row
echo "row_name,MAE,MFE,r_made" > "$output_file"

# Loop through input file and extract data
declare -A row_data  # Create an associative array to store row data
while read -r line; do
  # Split line into components
  row_name=$(echo "$line" | awk '{split($0, a, ".q:"); print a[1]}')
  column_name=$(echo "$line" | awk '{split($0, a, ".q:"); print a[2]}')
  value=$(echo "$line" | awk '{split($0, a, ": "); print a[2]}')
  
  # Store data in associative array
  row_data["$row_name.$column_name"]=$value
done < "$input_file"

# Loop through row data and write to output file
for row_name in "${!row_data[@]}"; do
  if [[ $row_name =~ ^([^\.]+)\. ]]; then  # Extract row name from column name
    row_name="${BASH_REMATCH[1]}"
  fi
  mae=${row_data["$row_name.MAE"]:-0}  # Use default value of 0 if key not found
  mfe=${row_data["$row_name.MFE"]:-0}
  r_made=${row_data["$row_name.r_made"]:-0}
  echo "$row_name,$mae,$mfe,$r_made" >> "$output_file"
done
