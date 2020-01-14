scriptencoding utf-8
let g:ale_completion_enabled = 1
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_set_quickfix = 1
let g:ale_set_loclist = 0
let g:ale_open_list = 0
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'never'

" ideally golint + staticcheck
let g:ale_linters = {
\ 'go': ['golint', 'govet'],
\ 'markdown': ['write-good', 'languagetool'],
\ 'text': ['write-good', 'languagetool']
\}
let g:ale_go_go111module = 'off'

let g:ale_fixers = {
\ 'go': ['gofmt'],
\ 'javascript': ['eslint'],
\ 'lua': ['luac', 'luacheck'],
\ 'typescript': ['tslint'],
\ 'python': ['black'],
\ '*': ['trim_whitespace', 'remove_trailing_lines']
\}

" Disable trim_whitespace for markdown
let g:ale_pattern_options = {
\ '\.md$': {
\   'ale_fixers': ['remove_trailing_lines', 'prettier']
\ }
\}

" Python Linter - Flake8 opts
let g:ale_python_flake8_options = '--max-line-length 88'

" Configure SignColumn appearance
highlight SignColumn ctermfg=10 ctermbg=07

hi clear ALEError
highlight ALEError cterm=underline
highlight ALEWarning cterm=underline

highlight ALEErrorSign ctermfg=1 ctermbg=07
highlight ALEWarningSign ctermfg=3 ctermbg=07
highlight ALEInfoSign ctermfg=13 ctermbg=07

let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_sign_info = ''
