" plugin: ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g_ctrlp_custom_ignore={
    \ 'dir': '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$'
    \ }
map <Leader>cp :CtrlPMixed<cr>
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX
