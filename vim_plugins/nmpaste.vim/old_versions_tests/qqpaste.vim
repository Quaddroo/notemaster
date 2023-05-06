" nnoremap <silent> <leader>p :call PasteTidImage()<cr>

function! PasteTidImage() abort
  let targets = filter(
        \ systemlist('xclip -selection clipboard -t TARGETS -o'),
        \ 'v:val =~# ''image''')
  if empty(targets) | return | endif

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
  let filename = outdir . '/image' . cnt . '.' . extension
  while filereadable(filename)
    call system('diff ' . tmpfile . ' ' . filename)
    if !v:shell_error
      call delete(tmpfile)
      break
    endif

    let cnt += 1
    let filename = outdir . '/image' . cnt . '.' . extension
  endwhile

  if filereadable(tmpfile)
    call rename(tmpfile, filename)
  endif

  let @* = '[[' . fnamemodify(filename, ':.') . ']]'
  normal! "*p
endfunction
