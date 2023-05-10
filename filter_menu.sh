#!/bin/bash
# ^^ needed for parent path trick to work
# see https://stackoverflow.com/questions/24112727/relative-paths-based-on-file-location-instead-of-current-working-directory
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P ) 
# ^^ issue on this line, "bad substitution" means not using #!/bin/bash as 1st line
cd "$parent_path"

CHOICE=$(echo -e "\nfilter edit\ncreate new table\nopen desired table\nwrite table to notes\nthumbnails\nclipboard\nsearch filter" | dmenu -p "filter" -l 10 )


case $CHOICE in
# 	"view list")
# 		/home/qq/codes/notemaster/filtering/new_trading_note.sh
# 		# Note: this needs to be refactored somehow, probably.
# 		;;
	"filter edit")
		gnome-terminal -- nvim ./filtering/filter_script.sh
		;;
	"create new table")
		# /home/qq/codes/notemaster/filtering/to_table.sh
		# ./filtering/filter_script.sh | ./tabulation/to_csv.sh
		./select_table_columns.sh
		;;
	"write table to notes")
		gnome-terminal -- bash -c "python3 ./tabulation/write_table_to_notes.py; exec bash"
		# ^^ terminal because there might be an error log
		;;
	"open desired table")
		libreoffice ./tabulation/desire.csv
		;;
	"thumbnails")
		./filtering/filter_script.sh | ./thumbnails.sh
		;;
	"clipboard")
		./filtering/filter_script.sh | ./filtering/input_to_clipboard.sh
		;;
	"search filter")
# 		SEARCHABLE_FILES=$(./filtering/filter_script.sh)
# 		gnome-terminal -- echo "$SEARCHABLE_FILES" && sleep 5
		# gnome-terminal -- ./filtering/fuzzy_find.sh "$SEARCHABLE_FILES"
# 		gnome-terminal -- ./filtering/filter_script.sh | xargs ./filtering/fuzzy_find.sh
		gnome-terminal -- ./filtering/search_filter.sh

esac


