" Create a temp file
function! my_fun#mktemp(suffix) abort
  let tempname = tempname() . "/" . a:suffix . "/"
  call mkdir(tempname, "p", 0700)
  return tempname
endfunction

" Alias to make a temp file called vim.log
let g:my_fun#logfile = my_fun#mktemp("vim") . "log"

function! my_fun#info(msg) abort
  call writefile(["INFO > " . a:msg], g:my_fun#logfile, 'a') 
  echohl MoreMsg | unsilent echom a:msg | echohl None
endfunction

" Installs a new app via npm or system cmd
function! my_fun#install(app, ...) abort
  let cmd = join(a:000)
  if cmd == ''
    let cmd = 'npm install -g ' . a:app
  endif
  if executable(a:app)
    return
  endif
  call my_fun#info('Installing ' . a:app . ' via: "' . cmd . '"...')
  echo system(cmd)
endfunction
command! -nargs=* MyInstall call my_fun#install(<f-args>)