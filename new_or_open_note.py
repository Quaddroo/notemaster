from datetime import datetime
import os
import sys

note_location = ' '.join(sys.argv[1:])

if os.path.exists(note_location):
    os.system(f"python3 open_note.py {note_location}")
else:
    note_name = note_location.split("/")[-1].replace(" ", "_") 
    # ^^ replacing makes working in terminal easier
    os.system(f"python3 new_note.py {note_name}")
