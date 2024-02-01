parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

TEMPALGIN=$( find $(cat note_folder) -name '*.q' | dmenu -p "note" -l 10 )

python3 new_or_open_note.py $TEMPALGIN
