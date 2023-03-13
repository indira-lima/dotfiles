" Function to work around the problem of vim-workspace
" having trouble loading NvimTree buffers, which would
" require to remember closing all NvimTree buffers
" before quitting the session
"
" This function checks if there's any NvimTree buffers open,
" closes them, and then saves the workspce and writes to all
" buffers. If quit_after is set to 1, quits all buffers too
"
" AUTHOR: Dahan Schuster
function! MySaveWorkspace(quit_after)
	if HasNvimTreeBuffer()
		NvimTreeClose
	endif

	" closes all unactive buffers (vim-workspace command)
	" 
	" NOTE: after using babar.nvim, closing hidden buffers
	" is not a good thing anymore
	" CloseHiddenBuffers

	" Creates the Session.vim file that will save the current vim state.
	" This requires the addition of a line in the end of the
	" pack/minpac/opt/vim-workspace/plugin/workspace.vim file to add the
	" MakeWorkspace command: `command! MakeWorkspace call s:MakeWorkspace(1)`
	MakeWorkspace

	" making sure we don't lose anything
	wall

	if a:quit_after
		quitall
	endif
endfunction
