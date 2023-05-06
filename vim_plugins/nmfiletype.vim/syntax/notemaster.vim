" Syntax matches, ordered by probable location in file
"
syn match qFieldLine /^.*: .*/ "qq version
syn match qFieldKey /^.*:/ "TODO: don't match with spaces in first character.

syn match qaccordion1start /{{{/
syn match qaccordion1end /}}}/

"(?=foo) TODO: different colors for different depths.
" syn match qaccordion2start /({{{.*){{{/
" syn match qaccordion2end /}}}.*(?=}}})/

syntax match qtitle /^#.*/

syntax keyword qtodos TODO DONE DOING

syntax match qlink /\[\[.*\]\]/ containedin=ALL
syntax match qimage /\[img\[.*\]\]/ containedin=ALL

" Checkboxes which don't match entire line:
syntax match qcheckbox_empty /\[ \]/ containedin=qbulletpoint1
syntax match qcheckbox_crossed /\[X\]/  containedin=qbulletpoint1
syntax match qcheckbox_partial /\[o\]/  containedin=qbulletpoint1

" Checkboxes which match entire line:
" syntax match qcheckbox_empty /\[ \].*/ containedin=qbulletpoint1
" syntax match qcheckbox_crossed /\[X\].*/ containedin=qbulletpoint1
" syntax match qcheckbox_partial /\[o\].*/ containedin=qbulletpoint1


syntax match qbulletpoint1 /^ *\t*-.*/
syntax match qbulletpoint2 /^ *\t*\*.*/


" Highlight matches, ordered same as syntax matches
"
highlight default link qFieldLine String
highlight default link qFieldKey Identifier

highlight default link qaccordion1start Folded
highlight default link qaccordion1end Folded
" ^ used to be FoldColumn

highlight default link qtitle Title 
" attempts to make it bold: seemd to work at first, but the terminal makes
" light magenta look dark magenta.
" highlight qtitle term=bold ctermfg=#fff gui=bold guifg=DarkMagenta cterm=bold
" hi link qtitle qtitlebold
" hi qtitlebold term=bold ctermfg=DarkMagenta gui=bold guifg=Magenta cterm=bold


highlight default link qtodos Comment 

highlight default link qlink HighlightUrl
highlight default link qimage HighlightUrl

highlight default link qcheckbox_empty CursorColumn
highlight default link qcheckbox_crossed DiagnosticOk
highlight default link qcheckbox_partial CursorColumn

highlight default link qbulletpoint1 Special 
highlight default link qbulletpoint2 Special



" highlight MatchParen ctermbg=red ctermfg=black guibg=red guifg=black
" hi MatchParen ctermbg=#c47ebd ctermfg=#51617d
