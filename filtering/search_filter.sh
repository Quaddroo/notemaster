#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P ) 
cd "$parent_path"


./filter_script.sh | xargs ./fuzzy_find.sh
