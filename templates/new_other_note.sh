# NOTE: echo -e usually, but i3 somehow messes that up and the \ns work automatically, not sure, multiple layers of parsing apparently adsfasfdsa

TEMPALGIN=$( echo "" | dmenu -p "name" -l 10 )

python3 /home/qq/codes/notemaster/templates/new_other_note.py $TEMPALGIN

