set encoding=UTF-8

" Solarized color scheme
syntax enable
colorscheme solarized
set background=light
" Vertical split bars
hi VertSplit ctermfg=12 ctermbg=7 " light
" hi VertSplit ctermfg=12 ctermbg=0 " dark

" Tab width = 2
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
autocmd FileType lua setlocal shiftwidth=3 tabstop=3
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab smarttab

" Use the mouse
set mouse=niv

" Use system clipboard (this only works on macOS)
set clipboard=unnamed

" Force watch updates
set backupcopy=yes
set autoread

" Splits
set splitright
set splitbelow

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Pane nav
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Ctrl-I to insert single char
:nmap <C-i> i_<esc>r

"Search Highlight
set incsearch

" Backspace fix
set backspace=indent,eol,start

" Autocomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete

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

" Powerline setup
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2
