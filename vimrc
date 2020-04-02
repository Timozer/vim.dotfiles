if lib#common#IsWindows()
    let g:xvim_home=expand('~/vimfiles')
else
    let g:xvim_home=expand('~/.vim')
endif

let &rtp=substitute(&rtp, '^', g:xvim_home.",", 'g')

let g:conf_files = [
            \ 'basic.vim',
            \ 'autocmd.vim',
            \ 'keymap.vim',
            \ 'tags.vim',
            \ 'plugins.vim',
            \]

for s:conf_file in g:conf_files
    let s:conf_path = g:xvim_home . '/conf/' . s:conf_file
    if filereadable(s:conf_path)
        exec ':so ' s:conf_path
    endif
endfor

