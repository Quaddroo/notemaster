# Takes list of files from STDIN, applies category filter to them.
# in | this_thing category value
# pushes to STDOUT.

# TODO: add comparison_operator

files=()
while read -r file; do
  files+=("'$file'")
done

echo "${files[@]}" | xargs grep -r -l --include=*.q "^$1: $2"
