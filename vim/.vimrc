set encoding=utf-8
scriptencoding utf-8

" Basic display
syntax enable
set background=dark

" Block cursor in normal, bar in insert
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Tab width = 2
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

" 4 spaces in python
augroup filetypes_python
  autocmd!
  autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab smarttab
augroup END

" Auto-line-wrap in .md and .txt files
augroup writing
  autocmd!
  au BufRead,BufNewFile *.md setlocal textwidth=88
  au BufRead,BufNewFile *.txt setlocal textwidth=88
augroup END

" Use the mouse
set mouse=a

" Use system clipboard
set clipboard=unnamed

" File watching for hot reload
set backupcopy=yes
set autoread

" Splits
set splitright
set splitbelow

" Don't yank when pasting in visual mode
vnoremap p "_dp

" Search
set incsearch
set hlsearch

" Backspace fix
set backspace=indent,eol,start

" Command aliases
:command W w
:command Wq wq
:command WQ wq
:command E e
:command Q q
:command Qa qa

