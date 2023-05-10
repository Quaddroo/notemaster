# requires windows with the title "forced_no_focus" to not automatically grab focs, no_focus [title="forced_no_focus"] in i3wm, to function properly.
# TODO: make readable

if [ $# -eq 0 ]; then
	# echo "No arguments provided."
	#
	OUTPUT=$(rg --heading --glob "*.q" . /home/qq/Notebooks/notemaster | sed 's/^$/NEWLINEHEREYO/g' | tr '\n' ' ' | sed 's/NEWLINEHEREYO/\n/g' | fzf --preview='FILEPATH=$(echo {} | sed "s/\.q.*/.q/"); cat $FILEPATH; FILEDIR=$(dirname $FILEPATH); IMAGENAME=$(grep -o -P -m 1 "(?<=\[img\[).*(?=\]\])" $FILEPATH); feh -B black -q --title "forced_no_focus" "$FILEDIR/$IMAGENAME" ') && FILEPATH=$(echo "$OUTPUT" | sed "s/\.q.*/.q/") && nvim $FILEPATH

else
	# echo "Arguments provided: $@"
	#
	OUTPUT=$(rg --heading --glob "*.q" . "$@" | sed 's/^$/NEWLINEHEREYO/g' | tr '\n' ' ' | sed 's/NEWLINEHEREYO/\n/g' | fzf --preview='FILEPATH=$(echo {} | sed "s/\.q.*/.q/"); cat $FILEPATH; FILEDIR=$(dirname $FILEPATH); IMAGENAME=$(grep -o -P -m 1 "(?<=\[img\[).*(?=\]\])" $FILEPATH); feh -B black -q --title "forced_no_focus" "$FILEDIR/$IMAGENAME" ') && FILEPATH=$(echo "$OUTPUT" | sed "s/\.q.*/.q/") && nvim $FILEPATH

fi

