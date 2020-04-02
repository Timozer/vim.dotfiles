" plugin: vim-airline
let g:airline_theme='dark'
" unicode symbols
"if g:os == "Darwin"
    "let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
"elseif g:os == "Linux"
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols_crypt = '🔒 '
    let g:airline_symbols_linenr = '␊'
    let g:airline_symbols_linenr = '␤'
    let g:airline_symbols_linenr = '¶'
    let g:airline_symbols_branch = '⎇'
    let g:airline_symbols_paste = 'ρ'
    let g:airline_symbols_paste = 'Þ'
    let g:airline_symbols_paste = '∥'
    let g:airline_symbols_whitespace = 'Ξ'
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
"endif

