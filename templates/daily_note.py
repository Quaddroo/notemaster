from datetime import datetime
import os
import sys

# THIS IS TRASH. HOPE TO GET AWAY FROM IT WHEN I COME UP WITH A CLEANER TEMPLATING METHODOLOGY.

def todays_note_name():
    monthday = datetime.now().strftime("%d")
    return f"daily_{monthday}"

def note_created_at_ISO_8601():
    return datetime.now().strftime("%Y-%m-%dT%H:%M %a")

def add_or_open_note():
    new_note_subfolder = datetime.now().strftime('%Y%m') 
    note_name = todays_note_name()
    extended_note_name = note_name + ".q" #q_btc_1.q
    new_note_location = f'/home/qq/Notebooks/notemaster/{new_note_subfolder}/{extended_note_name}'
    if os.path.exists(new_note_location):
#         os.system('../open_note.sh {new_note_location}')
        os.system(f'python3 /home/qq/codes/notemaster/open_note.py {new_note_location}')
    else:
        add_new_note(new_note_location)

def add_new_note(new_note_location):
    print("new note location:")
    print(new_note_location)

    os.system(f'cp ~/codes/notemaster/templates/daily_template.q {new_note_location}')

#     os.system(f"sed -i 's/AUTOTITLE_PLACE/{note_base_name}/' {new_note_location}")

    os.system(f"sed -i 's/AUTOCREATED_PLACE/{note_created_at_ISO_8601()}/' {new_note_location}")

#    os.system(f"cd {new_note_actual_location}")

    final_command = f"gnome-terminal -- nvim +8 {new_note_location}"
#     os.system(f"echo {final_command} | cat > /home/qq/debuglog1")
    os.system(final_command)


add_or_open_note()
