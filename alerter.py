import os

def alert(message):
    os.system(f"qbeep& zenity --warning --width=1000 --height=500 --text '{message}'")
