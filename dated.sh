echo "" | dmenu -p "date" -l 1 -nb '#3466a5' -nf yellow -sb '#3466a5' | xargs date --iso-8601 -d | xargs python3 templates/daily_note.py
