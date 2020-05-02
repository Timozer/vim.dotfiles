" =============================================================================
" auto commands
au BufWinEnter *.inc set filetype=asm
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

augroup TexFileType
    au!
    au BufWinEnter *.tex,*.cls,*.sty set filetype=tex
    au BufNewFile,BufRead *.tex,*.cls,*.sty set filetype=tex
    au BufNewFile,BufRead *.tex set spell
augroup END

au FileType c,cpp set path+=** | nmap <leader>sh :call SwitchSourceHeader()<CR>
function! SwitchSourceHeader()
    if (expand ("%:e") == "cpp")
        find %:t:r.h
    else
        find %:t:r.cpp
    endif
endfunction

let g:xvim_view_ignore_filetype = "gitcommit,gitrebase,svn,hgcommit"
let g:xvim_view_ignore_buftype = "quickfix,nofile,help"

function! s:ViewCheck()
    if index(split(g:xvim_view_ignore_buftype, ","), &buftype) != -1 
        return 1
    endif

    if index(split(g:xvim_view_ignore_filetype, ","), &filetype) != -1
        return 1
    endif
endfunction

function! s:ViewSave()
    if s:ViewCheck() == 1
        return
    endif
    mkview!
endfunction

function! s:ViewLoad()
    if s:ViewCheck() == 1
        return
    endif
    loadview
endfunction

autocmd BufWritePost,BufLeave,WinLeave ?* call s:ViewSave()
autocmd BufWinEnter ?* call s:ViewLoad()


function! MakeOrUpdateSession(automake)
    let b:sessiondir = g:xvim_sessions_dir . getcwd()
    let b:sessionfile = b:sessiondir . "/session.vim"
    if (filereadable(b:sessionfile))
        echom "Updating session..."
        exe "mksession! " . b:sessionfile
    else
        echom "Makeing session..."
        let l:allowmake = 0
        if (a:automake == 0)
            for l:dir in g:xvim_sessions_root
                echom g:_xvim_cwd . "/" . l:dir
                sleep 5
                if (filewritable(expand(g:_xvim_cwd . "/" . l:dir)) == 2)
                    echom g:_xvim_cwd . "/" . l:dir . " exists"
                    let l:allowmake = 1
                    break
                endif
            endfor
        else
            let l:allowmake = 1
        endif
        if l:allowmake == 1
            echom "make session"
            if (filewritable(b:sessiondir) != 2)
                exe 'silent !mkdir -p ' b:sessiondir
                redraw!
            endif
            exe 'mksession! ' . b:sessionfile
        endif
    endif
endfunction

" Loads a session if it exists
function! LoadSession()
    if g:xvim_sessions_autoload == 1
        let b:sessiondir = g:xvim_sessions_dir . getcwd()
        let b:sessionfile = b:sessiondir . "/session.vim"
        if (filereadable(b:sessionfile))
            exe 'source ' b:sessionfile
        endif
    endif
endfunction

"au VimEnter * nested :call LoadSession()
"au VimLeave * :call MakeOrUpdateSession(0)
"map <F1> :call MakeOrUpdateSession(1)<CR>
