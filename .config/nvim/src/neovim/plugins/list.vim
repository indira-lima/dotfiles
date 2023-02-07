"""" List of all NeoVim plugins
"""" Uses vim-plug, must be included between plug#begin and plug#end

" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}		" Code completion for Neovim 

" Markdown preview in browser
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
