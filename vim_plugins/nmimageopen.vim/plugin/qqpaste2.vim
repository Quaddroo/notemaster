fun! NFH_png(filename)
	" first want to cd to the directory of the current document that's being
	" edited, otherwise relative paths won't work.
	let directory_containing_file = expand('%:p:h')
	let var_to_call= "cd '" . directory_containing_file . "' && feh -B '#999999' '" . a:filename . "' &"
	"call system("feh -B black " . a:filename . "&")
	call system(var_to_call)
	" echo var_to_call
endfun
