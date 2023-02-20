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

" Zoom active buffer with Zi (Zoom In) 
noremap Zi <c-w>_ \| <c-w>\|

" Restet zoom with Zo (Zoom Out) (set all open buffers to equal size)
noremap Zo <c-w>=

" run macros on all selected lines without breaking on
" the first non-matching line
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" turn off search highlighting with <CR> (carriage-return)
nnoremap <CR> :nohlsearch<CR><CR>

" Exit terminal mode with ESC
tnoremap <Esc> <C-\><C-n>

