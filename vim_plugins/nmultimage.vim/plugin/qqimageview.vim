nnoremap gX :call ViewAllImages()<cr>

function! ViewAllImages() abort
	" let current_directory = getcwd()
	let current_file_path = expand('%:p') " Containing file
	let directory_containing_file = expand('%:p:h')

	" call feh $(grep -o -P '(?<=\[img\[).*(?=\]\])' current_directory)
	let command_name = "cd '" . directory_containing_file . "' && feh -B '#999999' $(grep -o -P '(?<=\\[img\\[).*(?=\\]\\])' '" . current_file_path . "') &"
	" enew
	" put=command_name
	call system(command_name)
	" echo command_name
endfunction
