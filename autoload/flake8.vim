if exists("g:flake8_loaded")
    finish
endif
let g:flake8_loaded = 1

if !exists("g:flake8_bin")
    let g:flake8_bin = "flake8"
endif

function! flake8#exec(...)
    let l:params = a:0 > 0 ? " " . join(a:000, " ") : ""
    let s:tempfile = tempname()
    let l:command = printf("%s -j $(nproc)%s", g:flake8_bin, l:params)
    let l:job = job_start(
                \ l:command,
                \ { "out_io": "file",
                \   "out_name": s:tempfile,
                \   "exit_cb": "EndJob"}
                \ )
    
    function! EndJob(job, status)
        if len(readfile(s:tempfile)) > 0
            call setqflist([])
            if v:version >= 700
                exec "silent! caddfile " . s:tempfile
            else
                if exists(":cgetfile")
                    exec "silent! cgetfile " . s:tempfile
                else
                    exec "silent! cfile " . s:tempfile
                endif
            endif
            botright copen
        else
            echo "[flake8] No error or warning found"
        endif
    endfunction
endfunction
