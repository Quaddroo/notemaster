# Takes list of files from STDIN, applies category filter to them.
# in | this_thing category value
# pushes to STDOUT.

# TODO: write
# TODO: add comparison_operator

files=()
while read -r file; do
  files+=("'$file'")
done


# testvar=$(echo ${files[@]} | xargs grep -r -l --include=*.tid "^$1:")


# targets=()
# while read -r REPLY; do
#    targets+=("$REPLY")
# done < <(echo ${files[@]} | xargs grep -r -l --include=*.tid "^$1:")
# 
# echo ${targets[0]}
#
echo "${files[@]}" | xargs grep -r -l --include=*.q "^$1: $2"
