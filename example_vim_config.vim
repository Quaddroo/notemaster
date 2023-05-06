" use system clipboard
set clipboard+=unnamedplus

set noet ci pi sts=0 sw=4 ts=4 "TODO document this
set mouse=a " use mouse
set termguicolors " use gui colors, since gnome-terminal supports the full range
colorscheme nord

" writing quickdelete faster shortcut
"
imap <C-h> <C-w>
"^^ h is backspace ofc in gayness

" Replacement for visual-block mode, which I override for pasting:
nnoremap <C-A-v> <C-v>

" copy/paste behavior my style, mainly to optimize note-taking
vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
imap <C-v> <Esc>pi
nmap <C-v> p
imap <C-y> <Esc>ddi
imap <C-x> <Esc>ddi
nmap <C-x> dd
nmap <C-c> yy

" yank file name (with path):
nmap yn :let @+ = expand("%:p")<cr>

" undo, redo with control-z
nnoremap <C-z> u
" redo is impossible on my terminal
" " nnoremap <C-s-z> <C-r>  << impossible with how retarded it's made.
" nnoremap <C-Z> <C-R>
" imap <C-z> <Esc>ui

" save with control+s
nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>a

" VIM-PLUG SETUP
" -----------------------------------------------------------------------------
call plug#begin()

Plug 'mg979/vim-visual-multi'
" pasting images
" nmpaste.vim
Plug '~/codes/notemaster/vim_plugins/nmpaste.vim'

" so gx opens images correctly and fast
" note that xdg-open is slow af
" nmimageopen.vim
Plug '~/codes/notemaster/vim_plugins/nmimageopen.vim'

" so gX opens all images
" nmultimageopen.vim
Plug '~/codes/notemaster/vim_plugins/nmultimageopen.vim'

" syntax highlighting
" nmfiletype.vim
Plug '~/codes/notemaster/vim_plugins/nmfiletype.vim'

" wikilink opening - my version
" barely edited verison of Plug 'mmai/wikilink'
Plug '~/codes/notemaster/vim_plugins/wikilink'

" lists
Plug 'dkarter/bullets.vim'

" syntax higlighting for links
Plug 'itchyny/vim-highlighturl'

call plug#end()

" this is so gx opens images properly:
let g:netrw_browsex_viewer = '-'

" Stupid extra feature for a plugin
let wikilinkAutosplit="off"

" proprietary note taking format, aka text
au BufRead,BufNewFile *.q		setfiletype notemaster
autocmd BufRead,BufNewFile   *.q setlocal foldmethod=marker

" toggle fold with space
nmap <Space> za

let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch',
	\ 'notemaster'
    \]

" sublime-text like shortcut for multiple selection
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-d>'           " replace visual C-n

" a way to make matching parentheses not make your cursor disappear
highlight MatchParen ctermbg=red ctermfg=white guibg=red guifg=white

" ctrl+i, ctrl+o records {}, I don't want that
" https://superuser.com/questions/836784/in-vim-dont-store-motions-in-jumplist
nnoremap <silent> } :<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>
nnoremap <silent> { :<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>
