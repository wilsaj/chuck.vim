if !exists("g:chuck_command")
    let g:chuck_command = "chuck"
endif

function! ChuckRunBuffer()
    silent !clear
    execute "!" . g:chuck_command . " " . bufname("%")
endfunction

nnoremap <buffer> <localleader>r :call ChuckRunBuffer()<cr>
