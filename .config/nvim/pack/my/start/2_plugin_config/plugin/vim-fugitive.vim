" The best Git integration for vim!
PackAdd tpope/vim-fugitive

" Open Git Fugitive status
nmap <c-g> :Git<cr>

" Write file to git
nnoremap <silent> <leader>gw :Gwrite<CR>

" Show git status
nnoremap <silent> <leader>gs :Git<CR>
