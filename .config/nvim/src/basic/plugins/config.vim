"""" Plugins configuration
"""" Uses vim-plug and plugin manager, must be included after plug#end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" source plugins keyboard shortcuts
runtime src/basic/plugins/keybindings.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" emmet-vim
""" Redefine emmet trigger key (still needs the trailing comma to fire: <TAB>,)
let g:user_emmet_leader_key='<TAB>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" rainbow (colorful brackets)
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" vim-javascript
let g:javascript_plugin_jsdoc = 1		" enable syntax highlight for JS Doc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" UltiSnips trigger configuration
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Vimsence
let g:vimsence_small_text = 'NeoVim'
let g:vimsence_small_image = 'neovim'
let g:vimsence_editing_details = 'Editando na velocidade da luz: {}'
let g:vimsence_editing_state = 'Trabalhando em: {}'
let g:vimsence_file_explorer_details = 'Onde é que tava aquele arquivo?'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Comfortable motion
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" NERDTree

""" Open current buffer in NERDTree
" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction
" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()
"""" END OF open current buffer in NERDTree

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Start vim-startify
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   NERDTree
            \ |   wincmd w
            \ | endif
