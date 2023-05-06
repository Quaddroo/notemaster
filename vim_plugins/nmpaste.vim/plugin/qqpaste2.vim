nnoremap <silent> <buffer>p :call PasteTidImage()<cr>

" TODO: make it more flexible in regards to where the images are pasted and
" the mechanism behind it. currently, always just pastes in same folder as
" file, and links in the same way. But an option to save in a separate dir
" would have to  be customized. Also unsure about how semantically clean this
" is.
"
" TODO: the way it iterates the pictures is slow as fuck. Must be way faster
" using grep or something.

function! PasteTidImage() abort
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
  let tmpfile = outdir . '/savefile_tmp.' . extension
  call system(printf('xclip -selection clipboard -t %s -o > %s',
        \ mimetype, tmpfile))

  let cnt = 0
  let dir_with_filename = outdir . '/image' . cnt . '.' . extension
  while filereadable(dir_with_filename)
    call system('diff ' . tmpfile . ' ' . dir_with_filename)
    if !v:shell_error
      call delete(tmpfile)
      break
    endif

    let cnt += 1
    let dir_with_filename = outdir . '/image' . cnt . '.' . extension
  endwhile

  if filereadable(tmpfile)
    call rename(tmpfile, dir_with_filename)
  endif

  let filename = 'image' . cnt . '.' . extension

  let @* = '[img[' . fnamemodify(filename, ':.') . ']]'
  normal! "*p
  " if we get this far, we pasted an image -> want to automatically break to a
  " new line.
  execute "normal! o\<Esc>"
  write
endfunction
