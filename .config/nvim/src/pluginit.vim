"""" Initializes the plugin manager
"""" Uses vim-plug as plugin manager

" Put Plug commands between `call plug#begin`and `call plug#end`
call plug#begin('~/.local/share/nvim/site/plugged')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" source all the vim plugins
runtime src/basic/plugins/list.vim

if (enablenvim)
	" source all neovim-only plugins
	runtime src/neovim/plugins/list.nvim
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
