" Solarized color scheme
syntax enable
set background=dark
" Vertical split bars
hi VertSplit ctermfg=00 ctermbg=248
set winwidth=80

" Tab width = 2
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
autocmd FileType lua setlocal shiftwidth=3 tabstop=3

" Use the mouse
set mouse=niv

" auto-strip trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Force watch updates
set backupcopy=yes
set autoread

" Disable autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

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

"Search Highlight
set incsearch

" Backspace fix
set backspace=indent,eol,start


" - - - - - - - - - - - - - - - - - -
" PLUGINS  / vim-plug               -
" - - - - - - - - - - - - - - - - - -
call plug#begin()

" Seamless tmux/vim navigation
Plug 'christoomey/vim-tmux-navigator'

" Syntastic (linting)
Plug 'vim-syntastic/syntastic'
source ~/.vim/syntastic-config.vim

" Python Syntax
Plug 'hdima/python-syntax'
let g:python_highlight_all = 1

"JavaScript Syntax
Plug 'pangloss/vim-javascript'

" JSX Syntax
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0

" CSS3 Syntax
Plug 'hail2u/vim-css3-syntax'

" Comments
Plug 'tpope/vim-commentary'

" Auto-surround
Plug 'tpope/vim-surround'

"Autocomplete
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
set completeopt-=preview

" TernJS
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" Auto bracket pairs
Plug 'jiangmiao/auto-pairs'

" Vim start screen
Plug 'mhinz/vim-startify'

" Vim sessions
Plug 'tpope/vim-obsession'

" Vim rename
Plug 'danro/rename.vim'

call plug#end()
" - - - - - - - - - - - - - - - - - -

" Powerline setup
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2
