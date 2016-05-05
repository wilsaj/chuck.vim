if !exists("g:chuck_command")
    let g:chuck_command = "chuck"
endif

function! ChuckServerStart()
    if exists("g:chuck_server_proc")
        call ChuckServerStop()
    endif

    let s:splitbelow = &splitbelow
    set splitbelow
    new ChuckShell
    let &splitbelow  = s:splitbelow
    execute "set buftype=nofile"
    silent let g:chuck_server_proc = vimproc#popen2("chuck --loop")
    execute 'wincmd w'

    "echo ">>> Chuck server started"
endfunction

function! ChuckServerRead()
    if !exists("g:chuck_server_proc")
        return
    endif
    let chuck_stdout = ""
    let chuck_stderr = ""

    if !g:chuck_server_proc.stdout.eof
        let chuck_stdout .= g:chuck_server_proc.stdout.read(1000, 0)
    endif
    if !g:chuck_server_proc.stderr.eof
        let chuck_stdout .= g:chuck_server_proc.stderr.read(1000, 0)
    endif

    if bufwinnr("ChuckShell") > 0
        execute bufwinnr("ChuckShell") 'wincmd w'
    else
        return
        "if a:context.split_command != ''
            "call vimshell#helpers#split(a:context.split_command)
        "endif

        "execute 'buffer' a:bufnr
    endif

    normal! zb
    put = chuck_stdout . chuck_stderr
    execute 'normal dd'
    execute 'wincmd p'
endfunction

function! ChuckServerStop()
    call vimproc#system("pkill chuck")

    if bufwinnr("ChuckShell") > 0
        execute bufwinnr("ChuckShell") 'wincmd c'
    endif

    if !exists("g:chuck_server_proc")
        echomsg ">>> Chuck server not found"
        return
    endif
    unlet g:chuck_server_proc
    echomsg ">>> Chuck server stopped"
endfunction

function! ChuckBufferAdd()
    if !exists("g:chuck_server_proc")
        call ChuckServerStart()
    endif
    call vimproc#system_bg(g:chuck_command . " --add " . bufname("%"))
endfunction

nnoremap <buffer> <F5> :call ChuckBufferAdd()<cr>
" XXX send extra <cr> or there's "press Enter or type command to continue"
" XXX echomsg is the cause of this
"nnoremap <buffer> <F10> :call ChuckServerStart()<cr><cr>
nnoremap <buffer> <F10> :call ChuckServerStart()<cr>
nnoremap <buffer> <F11> :call ChuckServerStop()<cr>
autocmd CursorHold,CursorHoldI * call ChuckServerRead()
set updatetime=300
