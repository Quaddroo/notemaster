TEMPALGIN=$( find /home/qq/Notebooks/notemaster/ -name '*.q' | dmenu -p "note" -l 10 )

python3 /home/qq/codes/notemaster/new_or_open_note.py $TEMPALGIN
