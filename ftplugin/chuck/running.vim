if !exists("g:chuck_command")
    let g:chuck_command = "chuck"
endif

function! ChuckRunBuffer()
    if has("win32") || has("win16")
        silent !cls
    else
        silent !clear
    endif
    execute "!" . g:chuck_command . " " . bufname("%")
endfunction

nnoremap <buffer> <localleader>r :call ChuckRunBuffer()<cr>
