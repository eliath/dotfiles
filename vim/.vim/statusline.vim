set laststatus=2
set statusline=         "reset line
set statusline=%f       "relative path to file
set statusline+=%m      "modified flag
set statusline+=%=      "left/right separator
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %y      "filetype

highlight StatusLineNC ctermfg=0 ctermbg=66
