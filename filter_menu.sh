#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P ) 
# ^^ issue on this line, "bad substitution" means not using #!/bin/bash as 1st line
# see https://stackoverflow.com/questions/24112727/relative-paths-based-on-file-location-instead-of-current-working-directory
cd "$parent_path"

CHOICE=$(echo -e "\nfilter edit\ncreate new table\nopen desired table\nwrite table to notes\nthumbnails\nclipboard\nsearch filter" | dmenu -p "filter" -l 10 )


case $CHOICE in
	"filter edit")
		gnome-terminal -- nvim ./filtering/filter_script.sh
		;;
	"create new table")
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
		gnome-terminal -- ./filtering/search_filter.sh

esac


