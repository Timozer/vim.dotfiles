
if exists("g:loaded_libcommon")
    finish
endif

let g:loaded_libcommon = 1

function! lib#common#IsWindows()
    return  (has('win32') || has('win64'))
endfunction

function! lib#common#IsOSX()
    return has('macunix')
endfunction

function! lib#common#IsLinux()
    return has('unix') && !has('macunix') && !has('win32unix')
endfunction
