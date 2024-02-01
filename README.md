## WARNING
Using this yourself might require a bit of work. I did not think of other people
when making this. 

# Notemaster

If you want to be a true master of your notes, you need to be in full control.
Everyone has a slightly different note-taking workflow. Notemaster is not some
specific setup, it is an ideology around building a note taking and analysis
framework.

Herein lies my personal setup following a couple basic assumptions:

    + Try to follow the Unix philosophy as much as possible - one tool for each functionality.
    + SPEED is of the essence. If taking/finding a note is slow, one will face
      internal resistance to do so.

As such, notemaster is (neo)Vim with a collection of plugins and scripts to edit
plain text files with embedded images (as links).

The choice of Vim is simple - it's the best text editor around, and easily
customizable.

Because of the first "Unix" assumption, it should be very easy to snag "just some" of
the functionality from this, if you like it.

# Startup
Change note_folder to contain the root folder you intend to keep your notes in.

# Included
## vim plugins
### nmimageopen.vim
Open images through vim.

Exposes NFH_png to open the image under the cursor in feh. It overrides the
netrw file handler, so `gx` opens the image. In the future, should probably remove
the relation to netrw, it has a bad thin-slice.

### nmultimage.vim
Open multiple images through vim.

Exposes ViewAllImages to open all included images in feh (tagged by
[img[relative_image_name]]), and a binding for it - `gX`. I might want to remove
the default binding in the future.

### nmpaste.vim
Paste images (as links) into vim.

Exposes NotemasterPaste, which checks if an image is in the clipboard. If it is,
places the image in the same folder as the text file and pastes a link to the
image in the wikilink [img[imagename]] format. If it is not, performs the usual
paste function.

Also binds normal p to NotemasterPaste. Might want to remove `<buffer>` tag.

### nmsmiles.vim
View simplified molecular-input line-entry system (SMILES) strings as images.

Exposes ViewChemStructure, which does the above with the line under the cursor,
and ViewChemStructures, which does the above with all structures in the file.
Structures must be delineated with "smiles: " in the beginning of the line.
Also provides default bindings - `gc` and `gC`, analogous to `gx` and `gX`. Perhaps
to-be-removed.

### nmfiletype.vim
Relatively personal, might not be useful to others.
Syntax highlighting.
Bindings to create wikilinks with `<C-l>`.
Bindings to cycle between semantic elements with `<A-c>`.
Other minor config.

### wikilink
I have an unincluded modification of https://github.com/mmai/wikilink that uses
underscores instead of dashes in file names. It's a single line change, not
worth including, but the included folder is an artifact of this.

## Scripts
### main_menu.sh
Just a dmenu to launch to select what to do with notes.

### note_menu.sh
Select a note to write. Notes are supposed to have a unique name - it will offer
to open up a note matching the name you're writing. If you want to force the
name you've written, Shift-`<cr>`.


### filtering/fuzzy_find.sh
Fuzzy find interactively in whole note text.

### filter_menu.sh
Various filtering utilities:

#### filtering/filter_script.sh
Opens a simple text file where you can write a filter with regular unix tooling
and a few accessory tools, listed there. Used by the other scripts.

#### filtering/search_filter.sh
Fuzzy search entire contents from the filter_script.

#### filtering/input_to_clipboard.sh
Copy the filtered file paths to clipboard

#### thumbnails.sh
Open the 'thumbnails' = first images from the passed in file list in feh. Can be
useful when combined with tabulation.

#### select_table_columns.sh
Major feature. Assuming your notes have a YAML-like frontmatter, used to
batch-edit multiple notes in a table format. Great alternative to tiddlywiki
tabulation plugins. write the columns you want to edit (e. g. "tags", "colour"),
and it will output a table of filter_script.sh notes in csv format. Edit with
your desired editor, and then write with:

#### tabulation/write_table_to_notes.py
Write the edited table (see above) to notes.

#### 'open desired table'
If you edit the output of select_table_columns.sh but accidentally close it, you
can still open it with this function in filter_menu.sh

# "Why dont you just use md files?"

There is no unified markdown standard, so I don't believe there is much pressure
to use it.
https://gist.github.com/vimtaai/99f8c89e7d3d02a362117284684baa0f

I find most of the markdown links that I see ugly, so I decided to use my
favourite version of the more aesthetically pleasing wikilink notation:

    [[some file]]

compared with some markdown link:

    [useless part](some file)

similarly for images:

    [img[some file]]  // "img" little ugly, likely future removed, for now
    simplifies parsing

compared with some markdown image:

    ![useless part](some file "more useless info")

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
    + python (maybe eradicated in the future for speed)
    + gnome-terminal (can use a different emulator, but it is hardcoded in a few
      places)

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
		- ^^ this can be opened with `gx`. Then, xdg-open is called on the image, and it opens with feh, as per my settings.
		- BUT XDG-OPEN IS SLOW AS FUCK. If I just use "feh", it's 100x faster at the very least. FUCK.
		- currently: mixture of a plugin (https://github.com/mmai/wikilink), gf and `gx` (modified with qqimage).
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
	    - view image with `gx` (nmimageopen.vim), depends: netrw, feh
	    - view all images with `gX` (nmultimageopen.vim), depends: netrw, feh
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
	- [X] fuzzy search: 
	    - just use fzf, no need to e. g. overload vim with excess shit like
	      telescope. unix philosophy after all.
	    - see: filtering/fuzzy_find.sh
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
	    - dialog --calendar "pick a day" 0 0 7 5 2023 << definitely good for day
	      selection!!!
	    - maybe some combo of cal and smenu is suitable for some of this
	      functionality
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
    - [ ] bug: in feh, it tries to find the relevant file through image name;
      but image names are not unique across multiple folders. a basic solution is to make all image
      names unique, but there is probably a better solution.
    - [ ] get rid of netrw
    - [ ] bug: the list plugin breaks the behavior of >> by mapping it to
      "indent shit" here 

    " Promote and Demote outline level call s:add_local_mapping(1, 'imap',
    '<C-t>', '<Plug>(bullets-demote)') call s:add_local_mapping(1, 'nmap', '>>',
    '<Plug>(bullets-demote)')
    
    if you turn off the mappings via " let g:bullets_set_mappings = 0 then the
    whole plugin does not work anymore.
    https://github.com/dkarter/bullets.vim/issues/137 }}} does not work anymore
