set encoding=utf-8
scriptencoding utf-8

" Basic display
syntax enable
set background=dark

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

" Pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" File navigation - CMD+Arrow up/down to go to beginning/end of file
nnoremap <C-a> <Home>
inoremap <C-a> <Home>
nnoremap <C-e> <End>
inoremap <C-e> <End>

" Don't yank when pasting in visual mode
vnoremap p "_dp

" Search
set incsearch
set hlsearch

" Backspace fix
set backspace=indent,eol,start

" Autocomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" File explorer
let g:netrw_liststyle = 3

" Command aliases
:command W w
:command Wq wq
:command WQ wq
:command E e
:command Q q
:command Qa qa

" Optional local config override
if filereadable(expand("~/local/profile.vim"))
  so ~/local/profile.vim
endif
