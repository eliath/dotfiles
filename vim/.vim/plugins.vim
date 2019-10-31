" Plugins configuration
" plugin manager: vim-plug | https://github.com/junegunn/vim-plug
" =============================================
call plug#begin()

" Solarized color scheme
Plug 'altercation/vim-colors-solarized'
so ~/.vim/plugged/vim-colors-solarized/autoload/togglebg.vim

" TOOLS -------------------------------------------
Plug 'tpope/vim-commentary'   " Comments
Plug 'tpope/vim-surround'     " Edit bracket/quote pairs commands
Plug 'tpope/vim-obsession'    " Sessions
Plug 'tpope/vim-vinegar'      " File explorer
Plug 'christoomey/vim-tmux-navigator' " tmux-style navigation
Plug 'danro/rename.vim'       " :Rename command
Plug 'zxqfl/tabnine-vim'      " TabNine Autocomplete
Plug 'cohama/lexima.vim'      " Auto brackets
Plug '/usr/local/opt/fzf'     " Fuzzy file search
Plug 'junegunn/fzf.vim'       " fzf vim integrations
Plug 'ryanoasis/vim-devicons' " developer icons

let g:lexima_enable_basic_rules = 0 " only insert pairs for newlines

" CMD+P to fuzzy search files
nnoremap <silent> <C-p> :Files<CR>

" SYNTAX + LINT -------------------------------------
" ale
so ~/.vim/ale-config.vim
Plug 'w0rp/ale'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
let g:go_fmt_autosave = 0 " ALE handles gofmt
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_fail_silently = 1
let g:go_list_type='quickfix'

" JavaScript
Plug 'leafgarland/typescript-vim' " Typescript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'heavenshell/vim-jsdoc'
let g:jsx_ext_required = 0

" Python
Plug 'hdima/python-syntax'
let g:python_highlight_all = 1

" Misc
Plug 'alvan/vim-closetag'         " Auto-close HTML/XML tags
let g:closetag_filenames = '*.html,*.xhtml,*.js,*.jsx,*.xml'
Plug 'hail2u/vim-css3-syntax'     " CSS 3
Plug 'hashivim/vim-terraform'     " Terraform (HCL) Syntax

call plug#end()
