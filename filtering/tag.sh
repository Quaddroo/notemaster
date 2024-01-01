#!/bin/bash
# Takes list of files from STDIN, applies single tag filter to them, 
# pushes to STDOUT.
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"
# ^^ see https://stackoverflow.com/questions/24112727/relative-paths-based-on-file-location-instead-of-current-working-directory

files=()
while read -r file; do
  files+=("'$file'")
done

echo "${files[@]}" | xargs grep -r -l --include=*.q "^tags:.*$1" 

