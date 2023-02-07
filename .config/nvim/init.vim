"""" NeoVim configuration
"""" This file includes all the configuration files
"""" Each file has it's own escope, like plugins and key bindings
""""
"""" Author: Dahan Schuster
"""" Github: https://github.com/Dahan-Schuster/dotfiles

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Environment configuration
let enablenvim=1

echo $VIMRUNTIME

"" Plugin manager initialization
runtime src/pluginit.vim

"" Basic vim initialization
runtime src/basic/init.vim

if (enablenvim)
	"" Neovim initialization
	runtime src/neovim/init.vim
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
