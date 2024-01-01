#!/bin/bash
# usage:
# filenames | to_csv.sh property1 property2 property3
# result: (commas instead of tabs):
# file		property1	property2	property3
# fname1	f1value1	f1value2	f1value3
# fname2	f2value1	f21value2	f2value3
#

# NOTE: use echo -e for calling from terminal to make \n in echo work.
# calling from i3 (my window manager) via shortcut somehow mucks that up
# and the \ns work automatically, not sure, multiple layers of parsing apparently.
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"


if [ "$1" = "" ]
then
  	echo "PROVIDE KEYS! (key: value)"
	exit 1
fi

files=()
while read -r file; do
  files+=("'$file'")
done

grep_regex=""
# Loop through all arguments and append them to the grep_regex string
for arg in "$@"
do
    grep_regex+="^${arg}: |"
done

# remove the trailing separator
grep_regex="${grep_regex%|}"

echo "${files[@]}" | xargs grep -P "$grep_regex" | python3 grep_to_csv.py > snapshot.csv
