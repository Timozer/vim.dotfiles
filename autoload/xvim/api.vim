
let s:apis = {}

function! xvim#api#import(name) abort
    if has_key(s:apis, a:name)
        return deepcopy(s:apis[a:name])
    endif
    let p = {}
    try
        let p = xvim#api#{a:name}#get()
        let s:apis[a:name] = deepcopy(p)
    catch /^Vim\%((\a\+)\)\=:E117/
    endtry
    return p
endfunction
