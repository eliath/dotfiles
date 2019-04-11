" Author: Elias <https://github.com/eliath>
" Description: modified staticcheck for Go files to ignore go modules

call ale#Set('go_staticcheck_options', '')
call ale#Set('go_staticcheck_lint_package', 0)
call ale#Set('go_staticcheck_GO111MODULE', '')

function! ale_linters#go#staticchecknomod#GetCommand(buffer) abort
    let l:filename = expand('#' . a:buffer . ':t')
    let l:options = ale#Var(a:buffer, 'go_staticcheck_options')
    let l:lint_package = ale#Var(a:buffer, 'go_staticcheck_lint_package')
    let l:go111module = ale#Var(a:buffer, 'go_staticcheck_GO111MODULE')

    " BufferCdString is used so that we can be sure the paths output from
    " staticcheck can be calculated to absolute paths in the Handler
    if l:lint_package
        return ale#path#BufferCdString(a:buffer)
        \   . (empty(l:go111module) ? '' : 'GO111MODULE="' . l:go111module . '" ')
        \   . 'staticcheck'
        \   . (!empty(l:options) ? ' ' . l:options : '') . ' .'
    endif

    return ale#path#BufferCdString(a:buffer)
    \   . ' ' . l:env_var . ' '
    \   . (empty(l:go111module) ? '' : 'GO111MODULE="' . l:go111module . '" ')
    \   . 'staticcheck'
    \   . (!empty(l:options) ? ' ' . l:options : '')
    \   . ' ' . ale#Escape(l:filename)
endfunction

call ale#linter#Define('go', {
\   'name': 'staticchecknomod',
\   'executable': 'staticcheck',
\   'command': function('ale_linters#go#staticchecknomod#GetCommand'),
\   'callback': 'ale#handlers#go#Handler',
\   'output_stream': 'both',
\   'lint_file': 1,
\})
