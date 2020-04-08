function! xvim#util#load_config(filename) abort
    let l:filepath = g:xvim_home . '/conf/' . a:filename
    if filereadable(l:filepath)
        call xvim#logger#info("read config from: " . l:filepath)
        execute 'source ' . l:filepath
    endif
endfunction

function! xvim#util#load_plugins() abort
    " load plugins manager first
    if !filereadable(g:xvim_plugins_dir . "/dein/README.md")
        " install dein
        if !s:dein_install()
            return 0
        endif
    endif

    exec 'set runtimepath+=' . g:xvim_plugins_dir . '/dein'
    for [name, value] in items(g:xvim_plugins)
        if has_key(value, 'before') && value['before'] && value['enable']
            call xvim#util#load_config('plugins_before/' . name . '.vim')
        endif
    endfor
    if dein#load_state(g:xvim_plugins_dir)
        call xvim#logger#info("plugin state is 1")
        call dein#begin(g:xvim_plugins_dir)

        call dein#add(g:xvim_plugins_dir . '/dein')
        for [name, value] in items(g:xvim_plugins)
            let l:options = {"if": value['enable'], "name": name}
            if has_key(value, 'options')
                call extend(l:options, value['options'])
            endif
            call dein#add(value['repo'], l:options)
        endfor

        call dein#end()
        call dein#save_state()
    endif
    if dein#check_install()
        call dein#install()
    endif
    for [name, value] in items(g:xvim_plugins)
        if value['enable']
            call xvim#util#load_config('plugins/' . name . '.vim')
        endif
    endfor

    return 1
endfunction

function! s:dein_install() abort
    if executable('git')
        exec '!git clone https://github.com/Shougo/dein.vim '
                    \ . g:xvim_plugins_dir . '/dein'
    else
        call xvim#logger#warn(
                    \ "Git needed to install plugins. Please install it first."
                    \ )
        return 0
    endif
    return 1
endfunction

function xvim#util#parse_args()
    echom argc()
    echom argv()
    if !argc()
        echom "stage 1"
        return [0, getcwd()]
    elseif argv(0) =~# '/$'
        echom "stage 2"
        let f = fnamemodify(expand(argv(0)), ':p')
        if isdirectory(f)
            echom "stage 2.1"
            return [1, f]
        else
            echom "stage 2.2"
            return [1, getcwd()]
        endif
    elseif argv(0) ==# '.'
        echom "stage 3"
        return [1, getcwd()]
    elseif isdirectory(expand(argv(0)))
        echom "stage 4"
        return [1, fnamemodify(expand(argv(0)), ':p')]
    else
        echom "stage 5"
        return [2, argv()]
    endif
endfunction
