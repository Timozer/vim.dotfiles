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

au FileType c,cpp exec "set tags+=" . g:xvim_home . "/qt5.tags"

function! RestoreCursor()
    if line("'\"") <= line("$")
        silent! normal! g`"
        return 1
    endif
endfunction

augroup restoreCursor
    autocmd!
    autocmd BufWinEnter * call RestoreCursor()
augroup END

let g:xvim_lastplace_ignore_filetype = "gitcommit,gitrebase,svn,hgcommit"
let g:xvim_lastplace_ignore_buftype = "quickfix,nofile,help"

function! s:lastplace()
    if index(split(g:xvim_lastplace_ignore_buftype, ","), &buftype) != -1 
        return
    endif

    if index(split(g:xvim_lastplace_ignore_filetype, ","), &filetype) != -1
        return
    endif

    try
        "if the file does not exist on disk (a new, unsaved file) then do nothing
        if empty(glob(@%))
            return
        endif
    catch
        return
    endtry

    if line("'\"") > 0 && line("'\"") <= line("$")
        "if the last edit position is set and is less than the
        "number of lines in this buffer.

        if line("w$") == line("$")
            "if the last line in the current buffer is
            "also the last line visible in this window
            execute "normal! g`\""

        elseif line("$") - line("'\"") > ((line("w$") - line("w0")) / 2) - 1
            "if we're not at the bottom of the file, center the
            "cursor on the screen after we make the jump
            execute "normal! g`\"zz"

        else
            "otherwise, show as much context as we can by jumping
            "to the end of the file and then to the mark. If we
            "pressed zz here, there would be blank lines at the
            "bottom of the screen. We intentionally leave the
            "last line blank by pressing <c-e> so the user has a
            "clue that they are near the end of the file.
            execute "normal! \G'\"\<c-e>"
        endif
    endif
    "if foldclosed(".") != -1 && g:lastplace_open_folds
        ""if we're in a fold, make the current line visible and recenter screen
        "execute "normal! zvzz"
    "endif
endfunction

augroup LastPlace
    autocmd!
    autocmd BufWinEnter * call s:lastplace()
augroup END
