if !exists("g:chuck_command")
    let g:chuck_command = "chuck"
endif

function! ChuckStartServer()
    if exists("g:chuck_server_proc")
        call ChuckStopServer()
    endif

    let s:splitbelow = &splitbelow
    set splitbelow
    split ChuckShell
    let &splitbelow  = s:splitbelow
    execute "set buftype=nofile"
    let g:chuck_server_proc = vimproc#popen2("chuck --loop")
    execute 'wincmd w'

    echomsg ">>> Chuck server started"
endfunction

function! ChuckProcRead()
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
    execute 'wincmd w'
endfunction

function! ChuckStopServer()
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

function! ChuckRunBuffer()
    if !exists("g:chuck_server_proc")
        call ChuckStartServer()
    endif
    call vimproc#system_bg(g:chuck_command . " --add " . bufname("%"))
endfunction

nnoremap <buffer> <F5> :call ChuckRunBuffer()<cr>
autocmd CursorHold,CursorHoldI * call ChuckProcRead()
set updatetime=300
