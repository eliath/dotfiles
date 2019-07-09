" NERDTree Sync modified plugin
" See source: https://codeyarns.com/2014/05/05/how-to-highlight-current-file-in-nerdtree/
" @eliath // July 9 2019

" Check if NERDTree is open or active
function! nerdsync#IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! nerdsync#SyncTree()
  if &modifiable && nerdsync#IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction
