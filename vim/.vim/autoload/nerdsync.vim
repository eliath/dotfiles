" NERDTree Sync modified plugin
" See source: https://codeyarns.com/2014/05/05/how-to-highlight-current-file-in-nerdtree/
" @eliath // July 9 2019

" Check if NERDTree is open or active
function! nerdsync#IsNERDTreeOpen()
  return exists('t:NERDTreeBufName') && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Check if current buffer file exists, is modifiable, and is within NERDTree
function! nerdsync#IsFileSyncable()
  return &modifiable && strlen(expand('%')) > 0
endfunction

" Call NERDTreeFind iff NERDTree is active, file is syncable,
" and we're not in vimdiff
function! nerdsync#SyncTree()
  if nerdsync#IsNERDTreeOpen() && nerdsync#IsFileSyncable() && !&diff
    NERDTreeFind && wincmd p
  endif
endfunction
