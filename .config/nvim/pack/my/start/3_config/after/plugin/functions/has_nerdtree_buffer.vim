" check if there's a NERDTree buffer open
" loops through all the buffers in the buflist() and checks
" the filetype of each buffer with the getbufvar function.
" If the filetype of a buffer is "nerdtree", it returns 1,
" otherwise returns 0
"
" AUTHOR: Dahan Schuster
function! HasNERDTreeBuffer()
	let buffers = nvim_list_bufs()
  for b in buffers
    if getbufvar(b, "&filetype") == "nerdtree"
      return 1
    endif
  endfor
  return 0
endfunction
