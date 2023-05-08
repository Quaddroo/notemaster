from datetime import datetime
import os
import sys

# THIS IS TRASH. HOPE TO GET AWAY FROM IT WHEN I COME UP WITH A CLEANER TEMPLATING METHODOLOGY.

def new_note_prefix():
    return "q_"

def new_note_name(instrument):
    return (new_note_prefix() + instrument).replace(" ", "_")

def note_created_at_ISO_8601():
    return datetime.now().strftime("%Y-%m-%dT%H:%M %a")

def add_new_note(instrument):
    new_note_subfolder = datetime.now().strftime('%Y%m') 

#    new_note_actual_location = f'~/Notebooks/TiddlyTest/testwiki/tiddlers/'

    note_base_name = new_note_name(instrument) #q_btc
    extended_note_name = os.popen(f"find ~/Notebooks/notemaster -name '{note_base_name}*.q' -printf '%f\\n' | sort -V | tail -n -1 | sed -E 's/(.*_)([0-9]+)(\.q$)/echo \"\\1$((\\2+1))\\3\"/e'").read().strip()
    new_note_location = f'/home/qq/Notebooks/notemaster/{new_note_subfolder}/{extended_note_name}'

    if os.path.exists(new_note_location):
        print(new_note_location)
        print("does exist")
        os.system("qbeep& zenity --warning --width=1000 --height=500 --text 'NEW NOTE MECHANISM FAILED HORRIBLY, NOTE EXISTS YOU MORON'")
        os.system(f"gnome-terminal -- nvim +6 {new_note_location}")
        return

    print("new note location:")
    print(new_note_location)

    os.system(f'cp ~/codes/notemaster/templates/new_trade_template.q {new_note_location}')

#     os.system(f"sed -i 's/AUTOTITLE_PLACE/{note_base_name}/' {new_note_location}")

    os.system(f"sed -i 's/AUTOCREATED_PLACE/{note_created_at_ISO_8601()}/' {new_note_location}")

#    os.system(f"cd {new_note_actual_location}")

    final_command = f"gnome-terminal -- nvim +6 {new_note_location}"
#     os.system(f"echo {final_command} | cat > /home/qq/debuglog1")
    os.system(final_command)


instrument = ''.join(sys.argv[1:])

add_new_note(instrument)

