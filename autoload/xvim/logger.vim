let s:LOGGER = xvim#api#import('logger')

let s:LOGGER.name = 'xvim'
let s:LOGGER.level = get(g:, 'xvim_log_level', 3)
let s:LOGGER.silent = 0
let s:LOGGER.verbose = 0

function! xvim#logger#debug(msg) abort
    call s:LOGGER.debug(a:msg)
endfunction

function! xvim#logger#info(msg) abort
    call s:LOGGER.info(a:msg)
endfunction

function! xvim#logger#warn(msg) abort
    call s:LOGGER.warn(a:msg)
endfunction

function! xvim#logger#error(msg) abort
    call s:LOGGER.error(a:msg)
endfunction

function! xvim#logger#viewRuntimeLog() abort
    let info = "### xvim runtime log :\n\n"
    let info .= "```log\n"

    let info .= s:LOGGER.view(s:LOGGER.level)

    let info .= "\n```\n"
    tabnew +setl\ nobuflisted
    nnoremap <buffer><silent> q :bd!<CR>
    for msg in split(info, "\n")
        call append(line('$'), msg)
    endfor
    normal! "_dd
    setl nomodifiable
    setl buftype=nofile
    setl filetype=markdown
endfunction


function! xvim#logger#viewLog(...) abort
    let info = "<details><summary> xvim debug information </summary>\n\n"
    let info .= "### xvim options :\n\n"
    let info .= "```toml\n"
    let info .= join(xvim#options#list(), "\n")
    let info .= "\n```\n"
    let info .= "\n\n"

    let info .= "### xvim layers :\n\n"
    let info .= xvim#layers#report()
    let info .= "\n\n"

    let info .= "### xvim Health checking :\n\n"
    let info .= xvim#health#report()
    let info .= "\n\n"

    let info .= "### xvim runtime log :\n\n"
    let info .= "```log\n"

    let info .= s:LOGGER.view(s:LOGGER.level)

    let info .= "\n```\n</details>\n\n"
    if a:0 > 0
        if a:1 == 1
            tabnew +setl\ nobuflisted
            nnoremap <buffer><silent> q :bd!<CR>
            for msg in split(info, "\n")
                call append(line('$'), msg)
            endfor
            normal! "_dd
            setl nomodifiable
            setl buftype=nofile
            setl filetype=markdown
        else
            echo info
        endif
    else
        return info
    endif
endfunction

function! xvim#logger#logfile(file) abort
    call s:LOGGER.file = a:file
endfunction

