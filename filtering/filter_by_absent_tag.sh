# Takes list of files from STDIN, applies single tag filter to them, 
# pushes to STDOUT.

files=()
while read -r file; do
  files+=("'$file'")
done

echo "${files[@]}" | xargs grep -r -L --include=*.q "^tags:.*$1"

