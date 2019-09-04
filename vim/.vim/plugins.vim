" Plugins configuration
" plugin manager: vim-plug
" =============================================
call plug#begin()

" Solarized
Plug 'altercation/vim-colors-solarized'
so ~/.vim/plugged/vim-colors-solarized/autoload/togglebg.vim


" VIM FEATURES -------------------------------------------

Plug 'tpope/vim-commentary'   " Comments
Plug 'tpope/vim-surround'     " Edit brackets + quotes in pairs
Plug 'cohama/lexima.vim'   " Auto bracket
Plug 'chaoren/vim-wordmotion' " CamelCase movement
Plug 'danro/rename.vim'       " :Rename command
Plug 'tpope/vim-obsession'    " Sessions
Plug 'zxqfl/tabnine-vim'      " TabNine Autocomplete
Plug 'christoomey/vim-tmux-navigator' " tmux-style navigation

" CTRL+P - fuzzy file search
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_by_filename = 1

" NERDTree -------------------------------------
Plug 'scrooloose/nerdtree'
map <silent> <C-b> :NERDTreeToggle<CR>
augroup nerdtree
  autocmd!
  autocmd StdinReadPre * let s:std_in=1
  " Open NERDTree if no files specified
  autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
  " open NERDTree into directory
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) &&
  \   !exists('s:std_in') | exe 'NERDTree' argv()[0] |
  \   wincmd p | ene | exe 'cd '.argv()[0] | endif
  " Close if only NERDTree window left open
  autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') &&
  \   b:NERDTree.isTabTree()) | q | endif
  " Sync NERDTree to the current buffer
  autocmd BufEnter * call nerdsync#SyncTree()
augroup END

" Show hidden files by default
let NERDTreeShowHidden=1


" LANGUAGE SYNTAX + LINT -------------------------------------

" ALE linting, fixing, completion
so ~/.vim/ale-config.vim
Plug 'w0rp/ale'

"JavaScript Syntax + Plugins ~ ~ ~ ~
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'heavenshell/vim-jsdoc'
let g:jsx_ext_required = 0
" ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

Plug 'leafgarland/typescript-vim' " Typescript
Plug 'hail2u/vim-css3-syntax'     " CSS3
Plug 'hashivim/vim-terraform'     " Terraform (HCL) Syntax
Plug 'alvan/vim-closetag'         " Auto-close <tags>
let g:closetag_filenames = '*.html,*.xhtml,*.js,*.jsx,*.xml'
Plug 'hdima/python-syntax'        " Python Syntax
let g:python_highlight_all = 1
Plug 'google/vim-maktaba'         " required for vim-bazel
Plug 'bazelbuild/vim-bazel'       " Bazel integration

" Vim-Go ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
let g:go_fmt_autosave = 0 " ALE handles gofmt
let g:go_fmt_fail_silently = 1
let g:go_list_type='quickfix'
"  ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

Plug 'ryanoasis/vim-devicons' " developer icons
let g:webdevicons_enable_nerdtree = 0

call plug#end()
