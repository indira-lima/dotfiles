" Function to work around the problem of vim-workspace
" having trouble loading NERDTree buffers, which would
" require to remember closing all NERDTree buffers
" before quitting the session
"
" This function checks if there's any NERDTree buffers open,
" closes them, and then saves the workspce and writes to all
" buffers. If quit_after is set to 1, quits all buffers too
"
" AUTHOR: Dahan Schuster
function! MySaveWorkspace(quit_after)
	if HasNERDTreeBuffer()
		" saves the current tab position, because :tabdo
		" leaves the last tab opened
		let s:currentTab = tabpagenr()	

		" uses :tabdo to run NERDTreeClose in all tabs
		tabdo NERDTreeClose

		" uses :execute and :normal to run {count}gt
		" this switches to tab at position {count}
		"
		" @see :help execute
		" @see :help normal
		" @see :help gt
		execute "normal! " . s:currentTab . "gt"
	endif

	" closes all unactive buffers (vim-workspace command)
	CloseHiddenBuffers

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
