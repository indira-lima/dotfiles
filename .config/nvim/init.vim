" Put Plug commands between `call plug#begin`and `call plug#end`
call plug#begin('~/.local/share/nvim/site/plugged')

Plug 'preservim/nerdtree'													" File navigator for Vim
Plug 'ryanoasis/vim-devicons'											" Better icons for Nerd Tree
Plug 'PhilRunninger/nerdtree-visual-selection'		" Enable file operations with multiple selections in NerdTree	
Plug 'mattn/emmet-vim'														" Emmet for vim (Use <TAB>, to expand)
Plug 'airblade/vim-gitgutter'											" Feature-rich git gutter
Plug 'tpope/vim-commentary'												" Comment code with gcc (line) and gc (block)
Plug 'vim-airline/vim-airline'										" Better status bar	
Plug 'junegunn/fzf'																" Fuzzy Finder config
Plug 'junegunn/fzf.vim'														" Fuzzy Finder for Vim
Plug 'luochen1990/rainbow'												" Rainbow brackets
Plug 'neoclide/coc.nvim', {'branch': 'release'}		" Code completion for Neovim
Plug 'pangloss/vim-javascript'										" JS syntax highlighting and formatting
Plug 'tpope/vim-fugitive'													" ('so good that should be illegal') Git plugin
Plug 'vimsence/vimsence'													" Discord rich presence for Vim

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting


"""" Plugins configuration

" Redefine emmet trigger key (still needs the trailing comma to fire: <TAB>,)
let g:user_emmet_leader_key='<TAB>'
nmap <c-e> :Files<cr>
nmap <c-n> :NERDTreeToggle<cr>
nmap <c-g> :Git<cr>

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

let g:javascript_plugin_jsdoc = 1		" enable syntax highlight for JS Doc

" Vimsence
let g:vimsence_small_text = 'NeoVim'
let g:vimsence_small_image = 'neovim'
let g:vimsence_editing_details = 'Editando na velocidade da luz: {}'
let g:vimsence_editing_state = 'Trabalhando em: {}'
let g:vimsence_file_explorer_details = 'Onde é que tava aquele arquivo?'

"""" Basic Behavior

set number              " show line numbers
set relativenumber      " show numbers relative to current line
set wrap                " wrap lines
set encoding=utf-8      " set encoding to UTF-8 (default was "latin1")
set mouse=a             " enable mouse support (might not work well on Mac OS X)
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching parentheses / brackets [{()}]
set laststatus=2        " always show statusline (even with only single window)
set ruler               " show line and column number of the cursor on right side of statusline
set visualbell          " blink cursor on error, instead of beeping


"""" Key Bindings

" move vertically by visual line (don't skip wrapped lines)
nmap j gj
nmap k gk

" Center screen (zz) after going or down half page
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

" run macros on all selected lines without breaking on
" the first non-matching line
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

"""" Vim Appearance

" put colorscheme files in ~/.vim/colors/
" colorscheme  badwolf " cyberpunk-neon      good colorschemes: murphy, slate, molokai, badwolf, solarized

set termguicolors

" Better folded code visualization
hi Folded guibg=016

" use filetype-based syntax highlighting, ftplugins, and indentation
syntax enable
filetype plugin indent on

"""" Tab settings

set tabstop=2           " width that a <TAB> character displays as
set shiftwidth=2        " number of spaces to use for each step of (auto)indent
set softtabstop=2       " backspace after pressing <TAB> will remove up to this many spaces

set autoindent          " copy indent from current line when starting a new line
set smartindent         " even better autoindent (e.g. add indent after '{')

"""" Search settings

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlighting with <CR> (carriage-return)
nnoremap <CR> :nohlsearch<CR><CR>

" use \\ for escape
" http://vim.wikia.com/wiki/Avoid_the_escape_key
inoremap \\ <Esc>

"""" Miscellaneous settings that might be worth enabling

"set cursorline         " highlight current line
set background=dark    " configure Vim to use brighter colors
set autoread           " autoreload the file in Vim if it has been changed outside of Vim

"""" Neovim specific shortcuts (uses the leader key)

" Shortcut to edit THIS configuration file: (e)dit (c)onfiguration
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>

" Shortcut to source (reload) THIS configuration file after editing it: (s)ource (c)onfiguraiton
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>

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

" Undo hunk (Git Gutter)
nnoremap <silent> <leader>uh :GitGutterUndoHunk<CR>

" improved keyboard navigation
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" Quite buffer
nnoremap <silent> <leader>qq :q<CR>

" Write file
nnoremap <silent> <leader>w :w<CR>

" Write file to git
nnoremap <silent> <leader>gw :Gwrite<CR>

" Show git status
nnoremap <silent> <leader>gs :Git<CR>

" Copy selection to clipboard
vnoremap <silent> <leader>cc "+y

"""" Coc Basic configuration

" May need for vim (not neovim) since coc.nvim calculate byte offset by count
" utf-8 byte sequence.
set encoding=utf-8
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Coc Fuzzy Finder
nmap <silent> <leader>F :Ag<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)

" Formatting entire code
nmap <leader>f  <Plug>(coc-format)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

""" End Coc basic configuration
