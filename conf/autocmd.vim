" =============================================================================
" auto commands
au BufWinEnter *.inc set filetype=asm
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

augroup TexFileType
    au BufWinEnter *.tex,*.cls,*.sty set filetype=tex
    au BufNewFile,BufRead *.tex,*.cls,*.sty set filetype=tex
    au BufNewFile,BufRead *.tex set spell
augroup END

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

