" Description: go vet for Go files without GO111MODULES

call ale#Set('go_go_executable', 'go')
call ale#Set('go_govet_options', '')

function! ale_linters#go#govetnomod#GetCommand(buffer) abort
    let l:options = ale#Var(a:buffer, 'go_govet_options')

    return ale#path#BufferCdString(a:buffer) . ' GO111MODULE=off '
    \   . ale#Var(a:buffer, 'go_go_executable') . ' vet '
    \   . (!empty(l:options) ? ' ' . l:options : '')
    \   . ' .'
endfunction

call ale#linter#Define('go', {
\   'name': 'govetnomod',
\   'output_stream': 'stderr',
\   'executable': {b -> ale#Var(b, 'go_go_executable')},
\   'command': function('ale_linters#go#govetnomod#GetCommand'),
\   'callback': 'ale#handlers#go#Handler',
\   'lint_file': 1,
\})
