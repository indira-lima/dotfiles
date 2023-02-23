" Open a terminal in a horizontal buffer
"
" AUTHOR: Dahan Schuster
function! OpenTerminalHorizontal()
	new
	terminal
	set nonumber
	set norelativenumber
	normal i
endfunction

