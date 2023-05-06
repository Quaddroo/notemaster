from datetime import datetime
import os
import sys


def generate_template_note_text(template_name, note_name):

def generate_template_note_name(template_name, note_comment):
    if template_name == "trading":
        # current tiddlywiki SHIT
        now = datetime.now()
        prefix = "d "
        postfix = " " + str(now.year)[2:4] + str(now.month) + str(now.day) + str(now.hour) + str(now.minute) + str(now.second)
        return f"{prefix}{note_comment}{postfix}"
    else: 
        raise "Impossible template"

def generate_template_note_save_location(template_name, note_name):
    if template_name == "trading":
        new_note_location = f'~/Notebooks/TiddlyTest/testwiki/tiddlers/{escaped_note_name}'
    else:
        raise "Impossible template"

def note_created_at_tiddlywiki_format():
    now = datetime.now()
    return str(now.year) + str(now.month) + str(now.day) + str(now.hour) + str(now.minute) + str(now.second) + str(now.microsecond)[0:3]

def add_new_note(template_name, note_comment):

    note_name = generate_template_note_name(template_name, note_comment)

    escaped_note_name = note_name.replace(" ", "\ ") + ".tid" #also with the fucking extension, I know this is a mess.
#    new_note_actual_location = f'~/Notebooks/TiddlyTest/testwiki/tiddlers/'
    new_note_location = f'~/Notebooks/TiddlyTest/testwiki/tiddlers/{escaped_note_name}'

    if os.path.exists(new_note_location):
        print(new_note_location)
        print("does exist")
        os.system("qbeep& zenity --warning --width=1000 --height=500 --text 'NOTE EXISTS YOU MORON'")
        os.system(f"vi +6 {new_note_location}")
        return
    print("new note location:")
    print(new_note_location)

    os.system(f'cp ~/codes/notemaster/trade_template.tid {new_note_location}')

    os.system(f"sed -i 's/AUTOTITLE_PLACE/{note_name}/' {new_note_location}")

    os.system(f"sed -i 's/AUTOCREATED_PLACE/{note_created_at_tiddlywiki_format()}/' {new_note_location}")

#    os.system(f"cd {new_note_actual_location}")

    os.system(f"vi +6 {new_note_location}")


instrument = ''.join(sys.argv[1:])

add_new_note(instrument)


