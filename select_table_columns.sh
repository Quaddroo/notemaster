#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P ) 
cd "$parent_path"

CHOICE=$(echo -e "tags r_made MAE MFE main_point\ntags main_point" | dmenu -p "choose columns" -l 10 )

# create ./snapshot.csv containing the present state
# used for updating the records afterwards after edits
./filtering/filter_script.sh | ./tabulation/to_csv.sh $CHOICE
# copy its contents to desire for editing
cp ./tabulation/snapshot.csv ./tabulation/desire.csv
# open desire in preferred table editor
libreoffice ./tabulation/desire.csv
