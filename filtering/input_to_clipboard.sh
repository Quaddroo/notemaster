# standard input -> linux clipboard
  
# exec setsid /usr/bin/xclip "$@" -selection clipboard
# ^^ if run from a detached terminal. for explanation of what this abomination is, see 
# https://unix.stackexchange.com/questions/316715/xclip-works-differently-in-interactive-and-non-interactive-shells
xclip -selection clipboard
