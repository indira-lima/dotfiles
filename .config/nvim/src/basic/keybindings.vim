"""" Add new keyboard shortcuts to vim

" use \\ for escape
" http://vim.wikia.com/wiki/Avoid_the_escape_key
inoremap \\ <Esc>

" In normal mode or in insert mode, press Alt-j to move the current line down, or press Alt-k to move the current line up.
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" move vertically by visual line (don't skip wrapped lines)
nmap j gj
nmap k gk

" Center screen after C-d (half page down) and C-u (half page up)
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

