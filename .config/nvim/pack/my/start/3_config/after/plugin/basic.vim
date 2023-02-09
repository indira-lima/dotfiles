" Defines how Vim should behave by default using the :set command

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
set cursorline          " highlight current line
set background=dark     " configure Vim to use brighter colors
set autoread            " autoreload the file in Vim if it has been changed outside of Vim
set autoindent          " copy indent from current line when starting a new line
set smartindent         " even better autoindent (e.g. add indent after '{')
set splitbelow			" new horizontal splits are on the bottom
set splitright			" new vertical splits are on the right

"""" Tab settings
set tabstop=2           " width that a <TAB> character displays as
set shiftwidth=2        " number of spaces to use for each step of (auto)indent
set softtabstop=2       " backspace after pressing <TAB> will remove up to this many spaces

"""" Search settings

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

"""" Vim Appearance

" put colorscheme files in ~/.vim/colors/
" colorscheme  badwolf " cyberpunk-neon      good colorschemes: murphy, slate, molokai, badwolf, solarized

set termguicolors				" Enables 24-bit RGB color

set guifont=MesloLGS\ NF\ 11 

" set background color of folded lines to transparent
hi Folded guibg=016

" use filetype-based syntax highlighting, ftplugins, and indentation
syntax enable
filetype plugin indent on
