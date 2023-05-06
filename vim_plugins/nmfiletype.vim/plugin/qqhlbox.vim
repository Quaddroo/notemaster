" " this is OPENAI code, it sucks. 
" " Define a new syntax group for checkboxes
" syntax match checkbox /^\s*\[\zs.\ze\]\s*/
" syntax keyword qqtodos TODO XXX FIXME NOTE
" " Highlight checked checkboxes in green
" " highlight checkbox ctermfg=green
" " Highlight partially checked checkboxes in yellow
" " highlight partial ctermfg=yellow
" highlight default link checkbox Keyword
" highlight default link qqtodos Todo 
" 
" " Define an autocommand to update checkbox highlighting on save
" " augroup checkbox
" "   autocmd!
" "   autocmd BufWritePre * :call UpdateCheckboxHighlighting()
" " augroup END
" " 
" " " Define a function to update checkbox highlighting
" " function! UpdateCheckboxHighlighting()
" "   " Save the current cursor position
" "   let save_cursor = getpos('.')
" " 
" "   " Search for all checkboxes and update their highlighting
" "   %s/\[\s*\]\|\[\s*[oO]\s*\]/\=HighlightCheckbox(submatch(0))/g
" " 
" "   " Restore the cursor position
" "   call setpos('.', save_cursor)
" " endfunction
" " 
" " " Define a function to determine the appropriate highlighting for a checkbox
" " function! HighlightCheckbox(checkbox)
" "   if a:checkbox =~ '\[.\]'
" "     " Checkbox is checked
" "     return 'checked'
" "   elseif a:checkbox =~ '\[[oO]\]'
" "     " Checkbox is partially checked
" "     return 'partial'
" "   else
" "     " Checkbox is not checked
" "     return ''
" "   endif
" " endfunction
