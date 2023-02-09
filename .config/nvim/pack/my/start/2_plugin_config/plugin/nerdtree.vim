PackAdd preservim/nerdtree

" Toggle NERDTree
nmap <c-n> :NERDTreeToggleVCS<cr>	

" Open current file in NERDTree
nmap <c-m> :NERDTreeFind<cr>

""" Open current buffer in NERDTree

" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
" autocmd BufEnter * call SyncTree()

"""" END OF open current buffer in NERDTree
