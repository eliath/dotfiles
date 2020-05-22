set encoding=utf-8
scriptencoding utf-8

" Solarized color scheme
syntax enable
colorscheme solarized
set background=dark
" Vertical split bars
hi VertSplit ctermfg=12 ctermbg=7 " light
" hi VertSplit ctermfg=12 ctermbg=0 " dark

" Tab width = 2
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

augroup filetypes_python
  autocmd!
  " 4 spaces in python
  autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab smarttab
augroup END

augroup filetype_lua
  autocmd!
  " 3 spaces in Lua
  autocmd FileType lua setlocal shiftwidth=3 tabstop=3
augroup END

" Auto-line-wrap in .md and .txt files
augroup writing
  autocmd!
  au BufRead,BufNewFile *.md setlocal textwidth=88
  au BufRead,BufNewFile *.txt setlocal textwidth=88
augroup END

" Auto-folding
set foldmethod=syntax
set foldlevelstart=99
hi Folded ctermbg=15

" Use the mouse
set mouse=niv
set ttymouse=sgr

" Use system clipboard (only works on macOS)
set clipboard=unnamed

" Force watch updates
set backupcopy=yes
set autoread

" Splits
set splitright
set splitbelow

" Pane nav
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Line nav - used w/ iTerm CMD+Arrow key mod
nnoremap <C-a> <Home>
inoremap <C-a> <Home>
nnoremap <C-e> <End>
inoremap <C-e> <End>

" Integrate <Opt>+<Right> w/ iTerm 'natural text editing' preset
nnoremap f e

" Ctrl-I to insert single char
:nmap <C-i> i_<esc>r

" Don't yank when pasting in visual mode
vnoremap p "_dp

"Search Highlight
set incsearch

" Backspace fix
set backspace=indent,eol,start

" Autocomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" File explorer
let g:netrw_liststyle = 3 " Open netrw in tree mode
augroup ProjectDrawer
    autocmd!
    " open file exporer when launching vim
    autocmd VimEnter * if argc() == 0 | Explore! | endif
    " open file explorer at dir on dir args
    autocmd VimEnter * if argc() == 1 && isdirectory(expand(argv()[0])) |
          \  exe 'Explore! '.argv()[0] | exe 'cd '.argv()[0] | endif
augroup END

" Change cursor shape between insert and normal mode in tmux
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" - - - - - - - - - - - - - - - - - -
" Aliases                           -
" - - - - - - - - - - - - - - - - - -
:command W w
:command Wq wq
:command WQ wq
:command E e
:command Q q
:command Qa qa
:command PrettyJSON %!python -m json.tool
:command Paste r!pbpaste

so ~/.vim/toggle-numbers.vim " run :Nums to toggle numbers
so ~/.vim/plugins.vim " Load Plugins

" local configs override
if filereadable(expand("~/local/profile.vim"))
  so ~/local/profile.vim
endif
