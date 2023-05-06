import sys
import vim

image_prefix = "[["
image_postfix = "]]"

def image_in_clipboard():
    o = subprocess.check_output('xclip -selection clipboard -t TARGETS -o')
    return "image" in o

def coolpaste():
    # if image_in_clipboard():
    # vim.current.buffer.append("this is a test")
    # print("coolpaste")
    row, col = vim.current.window.cursor
    current_line = vim.current.buffer[row-1]
    new_line = current_line[:col] + "this is a test" + current_line[col:]
    vim.current.buffer[row-1] = new_line


