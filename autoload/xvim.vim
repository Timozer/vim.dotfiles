
function! xvim#begin() abort
    call xvim#util#load_config('init.vim')

    let s:status = xvim#util#parse_args()
    if s:status[0] == 0 || s:status[0] == 1 " current working directory
        let g:_xvim_cwd = fnamemodify(s:status[1], ':~')
        "if !(g:xvim_sessions_autoload == 1 && filereadable(g:xvim_sessions_dir . expand(g:_xvim_cwd) . "/session.vim")) 
        augroup xvim_welcome
            au!
            autocmd VimEnter * call xvim#welcome()
        augroup END
        "endif
    "elseif s:status[0] == 1 " directory 
    else " file 
        call xvim#logger#info("startup arguments: " . string(s:status[1]))
    endif

    " options
    call xvim#util#load_config('default/basic.vim')
    " autocmd
    call xvim#util#load_config('autocmd.vim')
    " keymap
    call xvim#util#load_config('keymap.vim')
    " plugins
    " call xvim#util#load_config('plugins.vim')
    if !xvim#util#load_plugins()
        call xvim#logger#error("not load plugins")
        return
    endif

    " file type
    filetype on
    filetype plugin on
    filetype indent on
endfunction

function! xvim#end() abort
endfunction

function! xvim#welcome() abort
    exec 'cd' fnameescape(g:_xvim_cwd)
    if exists(':Startify') == 2
        if isdirectory(bufname(1))
            bwipeout! 1
        endif
        let g:startify_lists = [
            \ { 'type': 'dir',       'header': ['   MRU '. g:_xvim_cwd] },
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            "\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            "\ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
        Startify
    endif
    if exists(':Defx') == 2
        Defx
        wincmd p
    endif
endfunction
