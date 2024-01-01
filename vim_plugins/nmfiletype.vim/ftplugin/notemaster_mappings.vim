" Create wikilinks with ctrl-l:
nmap <C-l> viwc[[<Esc>pa]]
xnoremap <expr> <C-l> mode() ==# 'V' ? '<Esc>^i[[<Esc>A]]<Esc>' : mode() ==# 'v' ? 'c[[<Esc>pa]]' : ''

" auto linebreak if over 80 chars
set tw=80

" cycle between wikilinks and images with alt-c/alt-C
" TODO: maybe make it cycle through regular links as well
" use call search because does not destroy current search
"
" Originally wanted to use Tab, but https://unix.stackexchange.com/questions/203418/bind-c-i-and-tab-keys-to-different-commands-in-terminal-applications-via-inputr
" Then wanted to use Esc, but same issue persists.
" Then Shift, but apparently it just does not work.
" last failed attempt:
" nmap <Tab> :call search('[[.*\]\]\\|[img[.*\]\]')<cr>ll
" nmap <S-Tab> hh:call search('[[.*\]\]\\|[img[.*\]\]', 'b')<cr>ll
" set <Tab>=[27;5;9~
"
" Ok, this might not make sense, but for some reason
" only half the brackets need to be escaped here:
" (this is specific to call search):
nmap <A-c> :call search('[[.*\]\]\\|[img[.*\]\]')<cr>ll
nmap <A-C> hh:call search('[[.*\]\]\\|[img[.*\]\]', 'b')<cr>ll

" toggle fold with space
nmap <Space> za
