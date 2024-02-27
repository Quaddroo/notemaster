#!/bin/bash
# NOTE: use echo -e for calling from terminal to make \n in echo work.
# calling from i3 (window manager) via shortcut somehow messes that up
# and the \ns work automatically, not sure, multiple layers of parsing apparently.
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

TEMPALGIN=$( echo -e "other note\nnote\ndaily\ndated\nfilter\nsearch" | dmenu -p "notemaster" -l 10 )

case $TEMPALGIN in
	"other note")
		./templates/new_other_note.sh
		# Note: this needs to be refactored somehow, probably.
		;;
	"note")
		./note_menu.sh
		;;
	"daily")
		python3 templates/daily_note.py
		;;
	"dated")
		./dated.sh
		;;
	"filter")
		./filter_menu.sh
		;;
	"search")
		gnome-terminal -- ./filtering/fuzzy_find.sh
esac


