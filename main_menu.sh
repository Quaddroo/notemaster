#!/bin/bash
# NOTE: use echo -e for calling from terminal to make \n in echo work.
# calling from i3 (my window manager) via shortcut somehow fucks that up
# and the \ns work automatically, not sure, multiple layers of parsing apparently.
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P ) # << issue on this line, "bad substitution"
cd "$parent_path"

# export DISPLAY=:0
# echo "penis" | xclip -selection clipboard 
# echo "penis" | exec setsid /usr/bin/xclip "$@" -selection clipboard 
# 
# exit

TEMPALGIN=$( echo -e "trading note\nnote\ndaily\nfilter\nsearch" | dmenu -p "notemaster" -l 10 )

case $TEMPALGIN in
	"trading note")
		/home/qq/codes/notemaster/templates/new_trading_note.sh
		# Note: this needs to be refactored somehow, probably.
		;;
	"note")
		/home/qq/codes/notemaster/note_menu.sh
		;;
	"daily")
		python3 templates/daily_note.py
		;;
	"filter")
		/home/qq/codes/notemaster/filter_menu.sh
		;;
	"search")
		gnome-terminal -- /home/qq/codes/notemaster/filtering/fuzzy_find.sh
esac


