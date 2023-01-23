"""" Initializes the plugin manager
"""" Uses vim-plug as plugin manager

" Installs Vim-Plug if not installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Put Plug commands between `call plug#begin`and `call plug#end`
call plug#begin('~/.local/share/nvim/site/plugged')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" source all the vim plugins
runtime src/basic/plugins/list.vim

if (enablenvim)
	" source all neovim-only plugins
	runtime src/neovim/plugins/list.vim
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Initialize plugin system
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" source plugins manual configuration
runtime src/basic/plugins/config.vim

" source neovim plugin configuration
if (enablenvim)
	runtime src/neovim/plugins/config.vim
endif
