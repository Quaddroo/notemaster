#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P ) 
cd "$parent_path"

files=()
while read -r file; do
  files+=("'$file'")
done


# FEH_INFO_COMMAND=';NO_EXTENSION=$(echo %N | sed "s/.png$//"); echo $(pwd)'

FEH_INFO_COMMAND=';NO_EXTENSION=$(echo %N | sed "s/.png$//"); DIRECTORY=$(dirname %F);  grep -r -l --include="*.q" "$NO_EXTENSION" "$DIRECTORY"'
FEH_ENTER_COMMAND=';[open in notemaster]NO_EXTENSION=$(echo %N | sed "s/.png$//"); DIRECTORY=$(dirname %F);  MATCHING_FILES=$(grep -r -l --include="*.q" "$NO_EXTENSION" "$DIRECTORY"); gnome-terminal -- nvim "$MATCHING_FILES"'

# FEH_ENTER_COMMAND=';[open in notemaster]NO_EXTENSION=$(echo %N | sed "s/.png$//"); DIRECTORY=$(dirname %F);  MATCHING_FILES=$(grep -r -l --include="*.q" "$NO_EXTENSION" "$DIRECTORY"); echo "$DIRECTORY"'

echo "${files[@]}" | xargs grep -o -P -m 1 '(?<=\[img\[).*(?=\]\])' | tr '\n' '\0' | sed -z 's|/[^/]*:|/|' | xargs -0 feh -B black --info "$FEH_INFO_COMMAND" -A "$FEH_ENTER_COMMAND" # | grep -l "[img[%N"' 


# grep with -Z deletes colons, making info unparseable.
# tr makes it null-separated by replacing newlines with nulls
# all the -z tags make sed treat it as null-separated
# -0 for xargs makes it treat it as null-separated
# the null-separation is needed to make feh not choke on spaces in filenames
# the final --info command is parsed to generate text annotations for feh, with %F and other subs
# notice the ; at the beginning - makes the info togglable.
# a lot to clean here after migration.

# echo "${files[@]}" | xargs grep -o -z -P -m 1 '(?<=\[img\[).*(?=\]\])' | sed -z 's|/[^/]*:|/|' | sed -z 's/$/.png/' # | xargs -0 feh -B black
# -z everywhere means that new lines are null-delimited or something, which means that spaces are not used for line breaks.
# this is necessary to make feh work with spaces in file names. 
# the first sed gets rid of the note file name, and leaves it like a link to the pic. the second sed adds .png to the end, and is
# going to be removed when I migrate away from that disgusting tiddlywiki format. [UPDATE: DONE, removed: | sed -z 's/$/.png/']
# -0 makes xargs treat shit as null-delimited as well.
#
# -A supports the ability to open the note in full using enter
