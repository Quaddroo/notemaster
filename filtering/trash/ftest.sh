
# read -r input
# echo "$input"


files=()
while read -r file; do
  files+=("'$file'")
#   echo "$file"
done


echo "${files[@]}"
