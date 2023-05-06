from datetime import datetime
import os
import sys
import alerter

note_location = ' '.join(sys.argv[1:])

if os.path.exists(note_location):
    os.system(f"gnome-terminal -- nvim +6 {note_location}")
else:
    alerter.alert("ERR: tried to open note that does not exist.")
