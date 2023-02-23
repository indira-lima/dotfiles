"""" Neovim specific shortcuts (uses the leader key)
"""" The default leader key is \, which is the one used here

" Select entire buffer
nnoremap <silent> <leader>a ggVG

" Shortcut to edit the init.vim configuration file: (e)dit (c)onfiguration
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>

" Shortcut to source (reload) the current configuration file after editing it: (s)ource (c)onfiguraiton
nnoremap <silent> <leader>sc :call SourceIfIsVimFile()<CR>

" toggle line numbers
nnoremap <silent> <leader>n :set number! number?<CR>

" toggle relative numbers
nnoremap <silent> <leader>N :set relativenumber! relativenumber?<CR>

" toggle buffer (switch between current and last buffer)
nnoremap <silent> <leader>bb <C-^>

" horizontal split with new buffer
nnoremap <silent> <leader>bh :new<CR>

" vertical split with new buffer
nnoremap <silent> <leader>bv :vnew<CR>

" open a terminal in a horizontal buffer
nnoremap <silent> <leader>bt :call OpenTerminalHorizontal()<CR>

" Undo hunk (Git Gutter)
nnoremap <silent> <leader>uh :GitGutterUndoHunk<CR>

" Back cursor to previous location
nnoremap <silent> <leader>bc ``

" improved keyboard navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Write file
nnoremap <silent> <leader>w :w<CR>

" Copy selection to clipboard
vnoremap <silent> <leader>cc "+y

""""""""""""""""""""""""""""""""""""""""""""""""""""""
