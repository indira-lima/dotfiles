" finish
" Automated Vim session management with file auto-save and persistent undo history
PackAdd thaerkh/vim-workspace

" Do not save sections without asking to
let g:workspace_autocreate = 0

" Disable autosave
let g:workspace_autosave = 0

" Map the function to <leader>ss ([s]ave [s]ession)
nnoremap <leader>ss :call MySaveWorkspace(1)<CR>
