" check if there's a NvimTree buffer open
" loops through all the buffers in the buflist() and checks
" the filetype of each buffer with the getbufvar function.
" If the filetype of a buffer is "NvimTree", it returns 1,
" otherwise returns 0
"
" AUTHOR: Dahan Schuster
function! HasNvimTreeBuffer()
	let buffers = nvim_list_bufs()
  for b in buffers
    if getbufvar(b, "&filetype") == "NvimTree"
      return 1
    endif
  endfor
  return 0
endfunction

