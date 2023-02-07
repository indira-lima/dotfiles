" Make sure macros are executed in all matching lines,
" instead of stopping in the first non-matching line
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

