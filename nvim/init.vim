"""" NeoVim configuration
"""" This file includes all the configuration files
"""" Each file has it's own escope, like plugins and key bindings
""""
"""" Author: Dahan Schuster
"""" Github: https://github.com/Dahan-Schuster/dotfiles

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Environment configuration
let g:enablenvim=1

" Configura o caminho de busca de arquivos de script do Neovim
" A sintaxe .,, significa que o Neovim primeiro procurará arquivos
" na pasta corrente, depois na pasta do usuário e por fim em
" outras pastas padrão
set path=.,, " 

" Adiciona a pasta de configuração do Neovim ao início da lista
" de pastas de pacotes, fazendo o Neovim procurar por plugins
" primeiro na pasta ~/.config/nvim
execute 'set packpath^=' . stdpath('config')

" Detect filetypes and run filetype plugins
filetype on
filetype plugin on
filetype indent on

" Leaves the rest of the configuration to Vim's own initialization
" system. The folder pack/my/start contains the plugins config files
