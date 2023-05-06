## WARNING
using this yourself will require a bit of work. I did NOT think of other people
when making this. As an example, some scripts contain absolute links, which will
break on your system.

This is super-under-construction.

I AM NOT A PRGORAMMER.

# Notemaster

If you want to be a true master of your notes, you need to be in full control.
Everyone has a slightly different note-taking workflow. Notemaster is my
personal setup following a couple basic assumptions:
    + Try to follow the UNIX philosophy - one tool for each functionality.
        + ^^ I don't do this fully, sorry
    + SPEED is of the essence. If taking/finding a note is slow, one will face
      internal resistance to do so.

As such, notemaster is (neo)Vim with a collection of plugins and scripts to edit
plain text files with embedded images.

The choice of Vim is simple - it's the best text editor around, and easily
customizable.

Because of the first assumption, it should be very easy to snag "just some" of
the functionality from this, if you like it.

# "WHY DONT YOU JUST USE MD FILES???"

There is no unified markdown standard.
https://gist.github.com/vimtaai/99f8c89e7d3d02a362117284684baa0f

I find most of the markdown links that I see ugly, so I decided to use the
much more aesthetically pleasing wikilink notation:
    [[some file]]
compared with some markdown link:
    [useless shit](some file)
similarly for images:
    [img[some file]]  // "img" little ugly, likely future removed, for now
    simplifies parsing
compared with some markdown image:
    ![useless shit](some file "more useless shit")
    ...
In any case, you can easily adapt my infrastructure to use markdown, and I
basically just take notes in markdown with those links/images. I using the custom
extension .q allows me to separate logic that would potentially break "standard"
markdown files.

# Some dependencies (all optional)
    + feh
    + grep, sed, xargs, etc
    + zenity
    + dmenu
    + neovim
    + python ;(

# Features/contents
I wrote a list of everything I want in my notes, and then I sought to fulfill
it. This is the list and how far I've gotten with it.

	- [X] text notes (editing files with Vim)
	- [X] keyboard navigation (Vim)
	- [X] arbitrary metadata (=tags) (key: value pairs in text files)
	- [X] lists - Plug 'dkarter/bullets.vim'
	- [X] links
		-  maybe https://github.com/aklt/rel.vim/blob/master/doc/rel.txt
		-  wait, vim has built-in link functionality. use "gf" on this:
		- [[test|test]]
		- [img[image0.png]]
		- ^^ this can be opened with gx. Then, xdg-open is called on the image, and it opens with feh, as per my settings.
		- BUT XDG-OPEN IS SLOW AS FUCK. If I just use "feh", it's 100x faster at the very least. FUCK.
		- currently: mixture of a plugin (https://github.com/mmai/wikilink), gf and gx (modified with qqimage).
		- loading the plugin takes around 1ms. Good fucking deal.
	- [X] folded text (available by default in vim) 
	    - available by default in Vim
	    - https://www.vimfromscratch.com/articles/vim-folding
	    - nmfiletype.vim configures using the default {{{ }}} vim fold notation
	      
	- [X] templates
	    - extremely trashy I'll admit, needs cleaning
	- [X] multiple edit sublime-style
	    - https://github.com/mg979/vim-visual-multi
	- [X] cycle between links with alt-c/alt-C
	    - nmfiletype.vim
	- [X] syntax highlighting
		- nmfiletype.vim
	- [o] image pasting/viewing
	    - viewing handled by feh outside of vim
	    - view image with gx (nmimageopen.vim), depends: netrw, feh
	    - view all images with gX (nmultimageopen.vim), depends: netrw, feh
	    - paste image from clipboard - nmpaste.vim
	- [ ] renaming both file and its associated links
	- [ ] encryption
	- [ ] trashbin
	- [o] note filtering/searching
	    - grep
	    - /filtering
	    - filter_menu.sh
	    - main_menu.sh > filter
	    - main_menu.sh > note
	    - filter_menu.sh > filter (write default filter)
	- [ ] fuzzy search: 
	    - maybe https://github.com/nvim-telescope/telescope.nvim
	- [ ] terminal-based flowcharts with links to notes, "brainmaps".
	- [o] multiple-view and edit note metadata in a table
	    - filter_menu.sh > filter
		- requires a csv editor, default: libreoffice
		- potential better alternatives:
		- https://www.visidata.org/docs/
		- https://en.wikipedia.org/wiki/Sc_(spreadsheet_calculator)
		- https://github.com/andmarti1424/sc-im
		- https://lock.cmpxchg8b.com/spreadsheet.html

	- [ ] link preview (mouse-over or other)
	- [ ] shared editing
	- [ ] quick sketching (on notes???)
	- [ ] fractal calendars, regular calendars
	- [ ] infinite 3d grid view
	- [ ] slide grid

in my vim config, I also added sublime-windows-style copy/cut/paste, since a lot of my
workflow revolves around using a mouse to screenshot, and pasting with p is
horrible then; similarly, the line copying/cutting is convenient and I'm used to
it.

for now, I also yn yank name (of file) to link between notes; this needs to be
cleaned up

also, ctrl+s to save

# TODO list: 

NOTE: since the setup is currently fully usable for my usecase and most of these
issues are not enough of a pain, progress will be extremely slow.

    - [ ] feh fails if a note includes pics that are not in its immediate
      directory (see camonotes 20230424)
    - [ ] get rid of python code
    - [ ] unfinished features
    - [ ] there is no reason for x and for s to put 1 char in clipboard buffer
    - [X] in insert mode, make ctrl+backspace delete a word (config.vim)
    - [ ] get rid of bash?
    - [ ] auto-add date/tags on opening a 'new' linked note
    - [ ] writing text below a foldable panel with "o" opens panel, stop it.
    - [ ] excise selected text into a new note?
    - [ ] if a column does not exist on any note, it is not created in
      create_new_table. fix this.
    - [ ] image paster speed: start by pasting the name, only then do the pic creation
      for higher responsiveness -> note: the problem is actually it iterating
      over the filesystem, as evidenced by the fact that it's instant if you do
      it in a new folder with no files in it.
    - [ ] migrate notemaster to relative paths instead of absolute
    - [X] daily note shortcut for opening today note (templated)
    - [ ] introduce global variables for repeating things
    - [ ] get all TODOs/checkboxes
    - [ ] migrate to ripgrep
    - [ ] fix tab cycling (see next link)
    - [ ] best terminal (or gvim?)
    - [X] autosave after image pasting (makes sense for me)
    - [ ] bug: if you go in a different note from the current note, pasting pics
    - [ ] bug: in feh, if multiple list items, opening them produces a bullshit
      new file, aka it does not work
    - [ ] get rid of netrw
    - [ ] bug: the list plugin breaks the behavior of >> by mapping it to
      "indent shit" here 

    " Promote and Demote outline level call s:add_local_mapping(1, 'imap',
    '<C-t>', '<Plug>(bullets-demote)') call s:add_local_mapping(1, 'nmap', '>>',
    '<Plug>(bullets-demote)')
    
    if you turn off the mappings via " let g:bullets_set_mappings = 0 then the
    whole plugin does not work anymore.
    https://github.com/dkarter/bullets.vim/issues/137 }}} does not work anymore
