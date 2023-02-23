" Function to source the current file if it's a .vim
"
" AUTHOR: Dahan Schuster
function! SourceIfIsVimFile()
	let s:filetype = expand("%:e")
	if s:filetype != 'vim'
		echo "Not a .vim file, skipping..."
		return	
	endif

	" pipe the file name into the source command
	echo expand("%:p") | source
endfunction
