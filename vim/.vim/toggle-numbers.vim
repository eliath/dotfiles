function ToggleLineNumbers()
  if (&number)
    set number!
    set relativenumber!
    echo "-line numbers"
  else
    set number
    set relativenumber
    echo "+line numbers"
  endif
endfunction
command! Nums call ToggleLineNumbers()
