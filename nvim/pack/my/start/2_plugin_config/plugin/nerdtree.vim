" File explorer
PackAdd preservim/nerdtree

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Nice to remember (hard to find in the docs):
"
" U: go up a dir
" Cc: go down a dir

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle NERDTree if already open, or highlight current file
function! NERDTreeToggleOrFind()
	" Toggle NERDTree if current buffer doesn't have a existing file or if its a Nerdtree instance
	if !filereadable(expand('%:p')) || &filetype == 'nerdtree'
		:NERDTreeToggle
	else
		:NERDTreeFind
	endif
endfunction

nmap <C-n> :call NERDTreeToggleOrFind()<cr>	

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif


