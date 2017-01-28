let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_wq = 1

" Appearance
let g:syntastic_error_symbol = '✖︎'
let g:syntastic_style_error_symbol = '✖︎'
let g:syntastic_warning_symbol = '▸'
let g:syntastic_style_warning_symbol ='▸'
highlight SignColumn ctermfg=07 ctermbg=00
highlight SyntasticErrorSign ctermfg=01 ctermbg=00
highlight SyntasticWarningSign ctermfg=03 ctermbg=00
highlight SyntasticError ctermfg=07 ctermbg=09
highlight SyntasticWarning ctermfg=07 ctermbg=11

" Lua
let g:syntastic_lua_checkers = ['luac', 'luacheck']

" Python
let g:syntastic_python_checker_args='--rcfile="~/workspace/source/pants-support/pylint/pylint.rc"'
