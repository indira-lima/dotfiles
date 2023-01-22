"""" Change some of the default Vim's behaviors with user defined functions


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" run macros on all selected lines without breaking on
" the first non-matching line
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
