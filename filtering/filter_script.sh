#!/bin/bash
#
# EDIT THIS TO PRODUCE YOUR FILTER.
#
# SUGGESTION: SAVE THE COMMAND + DATE ALONGSIDE YOUR ANALYSES!
#
# see https://stackoverflow.com/questions/24112727/relative-paths-based-on-file-location-instead-of-current-working-directory
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

# custom:
# find $(cat ../note_folder) -name '*.q' | xargs grep -r -l ".*srm.*"
find $(cat ../note_folder) -name 'f*.q'

# TAGS: {{{
# find $(cat ../note_folder) -name '*.q' | ./tag.sh trade | ./tag.sh " im"
# find $(cat ../note_folder) -name '*.q' | ./tag.sh trade | ./tag.sh HHBB | ./filter_by_absent_tag.sh zim_oldmain
# find $(cat ../note_folder) -name '*.q' | ./tag.sh trade | ./tag.sh zim
# find $(cat ../note_folder) -name '*.q' | ./tag.sh trade | ./tag.sh HTBO
# find $(cat ../note_folder) -name '*.q' | ./tag.sh trade | ./tag.sh stn
# find $(cat ../note_folder) -name '*.q' | ./tag.sh daily
# find $(cat ../note_folder) -name '*.q' | ./tag.sh trade | ./tag.sh " cf "
# find $(cat ../note_folder) -name '*.q' | ./tag.sh trade | ./tag.sh "ecl" | ./tag.sh "nl"
# find $(cat ../note_folder) -name '*.q' | ./tag.sh plant
# find $(cat ../note_folder) -name '*magic*.q' | ./tag.sh trade
# find $(cat ../note_folder) -name '*.q' | xargs grep -r -l "lilaste"
# find $(cat ../note_folder) -name '*.q' | ./tag.sh trade | ./tag.sh "HHA"
# }}}

# SPECIFIC DAY: {{{
# find $(cat ../note_folder) -name '*.q' | xargs grep -r -l "^created: 2023-04-17"  | ./tag.sh trade
# find $(cat ../note_folder) -name '*.q' | xargs grep -r -l "^created: 2023-04-1[8-9]"  | ./tag.sh trade
# find $(cat ../note_folder) -name '*.q' | xargs grep -r -l "^created: 2023-04-20"  | ./tag.sh trade
# find $(cat ../note_folder) -name '*.q' | xargs grep -r -l "^created: 2023-05-08"  | ./tag.sh trade
# }}}

# WEEK: {{{
# find $(cat ../note_folder) -name '*.q' | xargs grep -r -l "^created: 2023-04-1[1-7]"  
# find $(cat ../note_folder) -name '*.q' | xargs grep -r -l "^created: 2023-04-0[1-8]" | ./tag.sh trade  
# ANNOYING WEEK:
# find $(cat ../note_folder) -name '*.q' | xargs grep -r -l "^created: 2023-04-09\|created: 2023-04-1[0-5]"
# find $(cat ../note_folder) -name '*.q' | xargs grep -r -l "^created: 2023-04-1[6-9]\|created: 2023-04-2[0-1]"
#
# find $(cat ../note_folder) -name '*.q' | xargs grep -r -l "^created: 2023-04-2[2-8]" | ./tag.sh trade
# }}}

# find $(cat ../note_folder) -name '*.q' | ./tag.sh trade | xargs sed -i '1i nomenclature_fixed: -1\nalso:\nhtf:'
# MONTH:
# find $(cat ../note_folder) -name '*.q' | xargs grep -r -l "^created: 2023-04-"  

###################################################################################################
# Example utilities:
# files | filter_by_present_tag.sh tag - take only ones containing the tag
# files | filter_by_absent_tag.sh tag - take only ones not containing the tag
# files | filter_by_category.sh category value - take only ones containing the category with value
#
# dont need probably:
# files | filter_by_present_category.sh category value - take only ones containing the category with value
# files | filter_by_absent_category.sh category value - take only ones containing the category with value
#
# and ofc can just pipe in into grep or whatever.
#
