from datetime import datetime
import os
import sys
from pathlib import Path

note_folder = Path('note_folder').read_text().replace('\n', '')

# THIS IS TRASH. HOPE TO GET AWAY FROM IT WHEN I COME UP WITH A CLEANER TEMPLATING METHODOLOGY.

def todays_note_name():
    monthday = expected_date.strftime("%d")
    return f"daily_{monthday}"

def note_created_at_ISO_8601():
    return expected_date.strftime("%Y-%m-%dT%H:%M %a")

def add_or_open_note():
    new_note_subfolder = expected_date.strftime('%Y%m') 
    note_name = todays_note_name()
    extended_note_name = note_name + ".q" #q_btc_1.q
    new_note_location = f'{note_folder}/{new_note_subfolder}/{extended_note_name}'
    if os.path.exists(new_note_location):
        os.system(f'python3 ./open_note.py {new_note_location}')
    else:
        add_new_note(new_note_location)

def add_new_note(new_note_location):
    print("new note location:")
    print(new_note_location)

    os.system(f'cp ./daily_template.q {new_note_location}')

    os.system(f"sed -i 's/AUTOCREATED_PLACE/{note_created_at_ISO_8601()}/' {new_note_location}")

    final_command = f"gnome-terminal -- nvim +8 {new_note_location}"

    os.system(final_command)

def get_expected_date(input_date):
    if input_date == "":
        return datetime.now()
    else:
        return datetime.fromisoformat(input_date)
        


input_date = ''.join(sys.argv[1:])
expected_date = get_expected_date(input_date)

add_or_open_note()
