" flake8 plugin
" Description:  
" Language:     
" Maintainer:   manslaughter <manslaughter03@gmail.com>
" Version:      0.0.1
" Last Change:  2018-02-18

" check if the script is already load
if exists("g:loaded_flake8_plugin")
    finish
endif

let g:loaded_flake8_plugin = 1

if v:version < 800
  echoerr "vim-grep: this plugin requires vim >= 800. GO GET IT"
endif

if filereadable(expand('<sfile>:p:h:h') . "/VERSION")
  let g:flake8_plugin_version = readfile(expand('<sfile>:p:h:h') . "/VERSION")[0]
endif

command! -nargs=* -complete=file Flake8 :call flake8#exec(<f-args>)
command! WriteFlake8 :exec "write" | call flake8#exec(expand("%"))
nnoremap <leader>wf :WriteFlake8<CR>
