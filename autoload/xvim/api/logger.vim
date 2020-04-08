let s:self = {
            \ 'name' : '',
            \ 'timefmt': '%H:%M:%S',
            \ 'silent' : 1,
            \ 'level' : 1,
            \ 'verbose' : 1,
            \ 'file' : '',
            \ 'temp' : [],
            \ }
" silent: [0, 1]
" level: [-1, 0, 1, 2, 3]
"   -1 : log no messages
"    0 : log error messages only
"    1 : log warning and error messages
"    2 : log information, warning and error messages
"    3 : log all messages
" verbose: [0, 1]

let s:ltype        = ['ERROR', 'WARN', 'INFO', 'DEBUG']
let s:_LTYPE_DEBUG = 3
let s:_LTYPE_INFO  = 2
let s:_LTYPE_WARN  = 1
let s:_LTYPE_ERROR = 0

function! xvim#api#logger#get() abort
    return deepcopy(s:self)
endfunction

function! s:self._fprintf(msg, ltype) abort
    if a:ltype > self.level
        return
    endif

    let l:time = strftime(self.timefmt)
    let log = ''
    if !empty(self.name)
        let log .= '[' . self.name . ']'
    endif
    let log .= '[' . l:time . '][' . s:ltype[a:ltype] . '] ' . a:msg

    if !self.silent
        if a:ltype == s:_LTYPE_WARN
            echohl WarningMsg
        elseif a:ltype == s:_LTYPE_ERROR
            echohl Error
        endif
        echom log
        echohl None
    endif
    call self.write(log)
endfunction

function! s:self.debug(msg) abort
    call self._fprintf(a:msg, s:_LTYPE_DEBUG)
endfunction

function! s:self.info(msg) abort
    call self._fprintf(a:msg, s:_LTYPE_INFO)
endfunction

function! s:self.warn(msg) abort
    call self._fprintf(a:msg, s:_LTYPE_WARN)
endfunction

function! s:self.error(msg) abort
    call self._fprintf(a:msg, s:_LTYPE_ERROR)
endfunction

function! s:self.write(msg) abort
    call add(self.temp, a:msg)
    if empty(self.file)
        return
    endif
    if !isdirectory(fnamemodify(self.file, ':p:h'))
        call mkdir(expand(fnamemodify(self.file, ':p:h')), 'p')
    endif
    let flags = filewritable(self.file) ? 'a' : ''
    call writefile([a:msg], self.file, flags)
endfunction

function! s:self.view(ltype) abort
    let info = ''
    if filereadable(self.file)
        let logs = readfile(self.file, '')
        let info .= join(
                    \ filter(logs, 'self._filter_callback(v:val, a:ltype)'),
                    \ "\n"
                    \ )
    else
        let info .= 'Log file does not exists, '
        let info .= 'only show logs for current process\n'
        let info .= join(
                    \ filter(
                        \ deepcopy(self.temp), 
                        \ 'self._filter_callback(v:val, a:ltype)'
                        \ ),
                    \ "\n"
                    \ )
    endif
    return info
endfunction

function! s:self._filter_callback(msg, ltype) abort
    if type(a:ltype) == 0
        let a:ltype = [a:ltype]
    endif
    for i in len(a:ltype)
        let l:ltype = s:ltype[i]
        if match(a:msg, l:ltype) != -1
            return 1
        endif
    endfor
    return 0
endfunction

function! s:self.clear(ltype) abort
    let self.temp = filter(
                \ deepcopy(self.temp), 
                \ '!self._filter_callback(v:val, a:ltype)'
                \ )
endfunction

