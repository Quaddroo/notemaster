nnoremap <silent> <buffer>p :call NotemasterPaste()<cr>

" TODO: make it more flexible in regards to where the images are pasted and
" the mechanism behind it. currently, always just pastes in same folder as
" file, and links in the same way. But an option to save in a separate dir
" would have to  be customized. Also unsure about how semantically clean this
" is.
"

function! NotemasterPaste() abort
	let targets = filter(
    	\ systemlist('xclip -selection clipboard -t TARGETS -o'),
    	\ 'v:val =~# ''image''')
	if empty(targets)
		normal! p
		return
	endif

	" if we get this far, we're pasting an image -> want to do in new line
	" always.
	execute "normal! o\<Esc>"

	let outdir = expand('%:p:h') " . '/img'
	if !isdirectory(outdir)
	call mkdir(outdir)
	endif

	let mimetype = targets[0]
	let extension = split(mimetype, '/')[-1]

	let filename_no_extension = system('find ' . outdir . ' -name "image*" -printf "%f\n" | sort -V | tail -n -1 | sed -E ''s/(image)([0-9]+)(\..*)/echo "\1$((\2+1))"/e''')
	let filename_no_extension = substitute(filename_no_extension, '\n$', '', '')

	let filename = filename_no_extension . '.' . extension
	let dir_with_filename = outdir . '/' . filename

" FROM HERE ON OUT IT SHOULD BE DONE
	call system(printf('xclip -selection clipboard -t %s -o > %s',
		\ mimetype, dir_with_filename))

	let @* = '[img[' . fnamemodify(filename, ':.') . ']]'
	normal! "*p
	" if we get this far, we pasted an image -> want to automatically break to a
	" new line.
	execute "normal! o\<Esc>"
	write

endfunction
