command! -nargs=* -complete=file Flake8 :call flake8#exec(<f-args>)
command! WriteFlake8 :exec "write" | call flake8#exec(expand("%"))
nnoremap <leader>wf :WriteFlake8<CR>
