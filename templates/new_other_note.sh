# NOTE: echo -e usually, but i3 somehow messes that up and the \ns work automatically, not sure, multiple layers of parsing apparently adsfasfdsa
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

TEMPALGIN=$( echo "" | dmenu -p "name" -l 10 )

python3 ./new_other_note.py $TEMPALGIN

