" Solarized color scheme
syntax enable
set background=dark
" Vertical split bars
hi VertSplit ctermfg=00 ctermbg=248

" Tab width = 2
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
autocmd FileType lua setlocal shiftwidth=3 tabstop=3
autocmd FileType python setlocal shiftwidth=2 tabstop=2

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

" Ctrl-I to insert single char
:nmap <C-i> i_<esc>r

"Search Highlight
set incsearch

" Backspace fix
set backspace=indent,eol,start

" - - - - - - - - - - - - - - - - - -
" Aliases                           -
" - - - - - - - - - - - - - - - - - -
:command W w

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

" Prefer local ocal eslint
Plug 'mtscout6/syntastic-local-eslint.vim'

" CSS3 Syntax
Plug 'alexlafroscia/postcss-syntax.vim'

" Comments
Plug 'tpope/vim-commentary'

" Auto-surround
Plug 'tpope/vim-surround'

"Autocomplete
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
set completeopt-=preview

" Auto bracket pairs
Plug 'jiangmiao/auto-pairs'

" Vim start screen
Plug 'mhinz/vim-startify'

" Vim sessions
Plug 'tpope/vim-obsession'

" Vim rename
Plug 'danro/rename.vim'

" Vim CamelCase movement
Plug 'chaoren/vim-wordmotion'

call plug#end()
" - - - - - - - - - - - - - - - - - -

" Powerline setup
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2
