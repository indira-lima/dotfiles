" finish
" Automated Vim session management with file auto-save and persistent undo history
PackAdd thaerkh/vim-workspace

" Do not save sections without asking to
let g:workspace_autocreate = 0

" Disable autosave
let g:workspace_autosave = 0

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
		# save the current tab position, because :tabdo
		# leaves the last tab opened
		let s:currentTab = tabpagenr()	

		# use :tabdo to run NERDTreeClose in all tabs
		tabdo NERDTreeClose

		# use {count}gt to go to tab {count}
		# @see :help gt
		execute s:currentTab . "gt"
	endif

	CloseHiddenBuffers

	" this requires the addition of a line in the end of the
	" pack/minpac/opt/vim-workspace/plugin/workspace.vim file
	" to add the MakeWorkspace command:
  " `command! MakeWorkspace call s:MakeWorkspace(1)`
	MakeWorkspace

	" make sure we don't lose anything
	wall

	if a:quit_after
		quitall
	endif
endfunction

" Map the function to <leader>ss ([s]ave [s]ession)
nnoremap <leader>ss :call MySaveWorkspace(1)<CR>
