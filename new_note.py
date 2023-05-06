from datetime import datetime
import os
import sys
import alerter

# takes as arg the name of the note to be created.
# decides the folder to place it by itself.
note_name = '_'.join(sys.argv[1:])

def note_created_at_ISO_8601():
    return datetime.now().strftime("%Y-%m-%dT%H:%M %a")

def add_new_note(note_name):
    new_note_subfolder = datetime.now().strftime('%Y%m') 
    # ^^ folder to place this note in. It's better to separate notes into 
    # months, too many notes in one folder makes certain file managers lag.

    extended_note_name = note_name + ".q" #also with the fucking extension, I know this is a mess.
    new_note_location = f'/home/qq/Notebooks/notemaster/{new_note_subfolder}/{extended_note_name}'

    if os.path.exists(new_note_location):
        alerter.alert("ERR: tried to make note where a note existed")
        return


    # This is a mess, need to refactor
    os.system(f'cp ~/codes/notemaster/templates/note_template.q {new_note_location}')

    os.system(f"sed -i 's/AUTOCREATED_PLACE/{note_created_at_ISO_8601()}/' {new_note_location}")

    os.system(f"gnome-terminal -- nvim +6 {new_note_location}")


add_new_note(note_name)


