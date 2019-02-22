let g:ale_completion_enabled = 1
set completeopt=menu,menuone,preview,noselect,noinsert

let g:ale_go_gometalinter_options = '--fast'
let g:ale_linters = {
\ 'go': ['gometalinter']
\}

let g:ale_fix_on_save = 1
let g:ale_fixers = {
\ 'go': [
\   'gofmt'
\ ],
\ 'javascript': [
\   'eslint',
\   'trim_whitespace',
\   'remove_trailing_lines'
\ ],
\ 'lua': [
\   'luac',
\   'luacheck'
\ ],
\ 'typescript': [
\   'tslint',
\   'trim_whitespace',
\   'remove_trailing_lines'
\ ],
\ '*': [
\   'trim_whitespace',
\   'remove_trailing_lines'
\ ]
\}

" Disable trim_whitespace for markdown
let g:ale_pattern_options = {
\ '\.md$': {
\   'ale_fixers': ['remove_trailing_lines']
\ }
\}

" Configure SignColumn appearance
highlight SignColumn ctermfg=10 ctermbg=07
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '◆'
hi clear ALEError
highlight ALEError cterm=underline
highlight ALEWarning cterm=underline
