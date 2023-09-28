nnoremap gC :call ViewChemStructures()<cr>
nnoremap gc :call ViewChemStructure()<cr>

function! ViewChemStructures() abort
	" let current_directory = getcwd()
	let current_file_path = expand('%:p') " Containing file
	let directory_containing_file = expand('%:p:h')

	" call feh $(grep -o -P '(?<=\[img\[).*(?=\]\])' current_directory)
	let command_name = "cd '" . directory_containing_file . "' && grep -o -P '(?<=^smiles: ).*' " . current_file_path . " | obabel -ismi -opng -xp 700 | feh - -B '#999999'"
	" enew
	" put=command_name
	call system(command_name)
	" echo command_name
endfunction


function! ViewChemStructure() abort
	" let current_directory = getcwd()
	let current_line = getline('.')
	let current_file_path = expand('%:p') " Containing file
	let directory_containing_file = expand('%:p:h')

	" call feh $(grep -o -P '(?<=\[img\[).*(?=\]\])' current_directory)
	let command_name = "echo '" . current_line . "' | sed 's/smiles: //g' | obabel -ismi -opng -xp 700 | feh - -B '#999999'"
	" enew
	" put=command_name
	call system(command_name)
	echo command_name
	" echo command_name
endfunction
