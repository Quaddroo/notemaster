#!/bin/bash
# Takes list of files from STDIN, applies single tag filter to them, 
# pushes to STDOUT.
#
#
#
# see https://stackoverflow.com/questions/24112727/relative-paths-based-on-file-location-instead-of-current-working-directory
#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

files=()
while read -r file; do
  files+=("'$file'")
done

# echo "${files[@]}" | xargs grep -r -l --include=*.q "^tags:.*$1" 
# TEMPORARY modification during the migration procedure for trade nomenclature
echo "${files[@]}" | xargs grep -E -r -l --include=*.q "^tags:.*$1|^also:.*$1" 
# NOTICE THE quotes!!!

