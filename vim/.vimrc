" Solarized color scheme
syntax enable
set background=dark
colorscheme solarized
" Vertical split bars
hi VertSplit ctermfg=14 ctermbg=00

" Tab width = 2
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
autocmd FileType lua setlocal shiftwidth=3 tabstop=3
autocmd FileType python setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab smarttab

" Use the mouse
set mouse=niv

" Use system clipboard (this only works on macOS)
set clipboard=unnamed

" auto-strip trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Force watch updates
set backupcopy=yes
set autoread

" Disable autocomment for `//`
inoremap <expr> <enter> getline('.') =~ '^\s*//' ? '<enter><esc>S' : '<enter>'
nnoremap <expr> O getline('.') =~ '^\s*//' ? 'O<esc>S' : 'O'
nnoremap <expr> o getline('.') =~ '^\s*//' ? 'o<esc>S' : 'o'

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
:command PrettyJSON %!python -m json.tool
:command Paste r!pbpaste

" - - - - - - - - - - - - - - - - - -
" PLUGINS  / vim-plug               -
" - - - - - - - - - - - - - - - - - -
call plug#begin()

" Seamless tmux/vim navigation
Plug 'christoomey/vim-tmux-navigator'

" Solarized
Plug 'altercation/vim-colors-solarized'
so ~/.vim/plugged/vim-colors-solarized/autoload/togglebg.vim

" Syntastic (linting)
Plug 'vim-syntastic/syntastic'
source ~/.vim/syntastic-config.vim

" NERDTree
Plug 'scrooloose/nerdtree'
map <silent> <C-b> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"JavaScript Syntaxes
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'heavenshell/vim-jsdoc'
Plug 'styled-components/vim-styled-components'

let g:jsx_ext_required = 0

"Autocomplete
Plug 'zxqfl/tabnine-vim'

" Prefer local eslint
Plug 'mtscout6/syntastic-local-eslint.vim'

" CSS3 Syntax
Plug 'hail2u/vim-css3-syntax'

" Comments
Plug 'tpope/vim-commentary'

" Auto-surround
Plug 'tpope/vim-surround'

" Vim sessions
Plug 'tpope/vim-obsession'

" Auto bracket & xml tag pairs
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
let g:closetag_filenames = '*.html,*.xhtml,*.js,*.jsx'

" Vim rename
Plug 'danro/rename.vim'

" Vim CamelCase movement
Plug 'chaoren/vim-wordmotion'

" Vim fuzzy file search
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Python Syntax
Plug 'hdima/python-syntax'
let g:python_highlight_all = 1

call plug#end()
" - - - - - - - - - - - - - - - - - -

" Powerline setup
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
set laststatus=2
