" plugin: tagbar
let g:tagbar_ctags_bin = '/usr/local/Cellar/ctags/5.8_1/bin/ctags'
let g:tagbar_width = 30
let g:tagbar_show_linenumbers = 1
let g:tagbar_expand = 1
let g:tagbar_singleclick = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_compact=1
let g:tagbar_type_cpp={
    \ 'kinds' :[
        \ 'd:macros:1',
        \ 'g:enums',
        \ 't:typedefs:0:0',
        \ 'e:enumerators:0:0',
        \ 'n:namespaces',
        \ 'c:classes',
        \ 's:structs',
        \ 'u:unions',
        \ 'f:functions',
        \ 'm:members:0:0',
        \ 'v:global:0:0',
        \ 'x:extrenal:0:0',
        \ 'l:local:0:0'
    \ ],
    \ 'sro' : '::',
    \ 'kind2scope':{
        \ 'g':'enum',
        \ 'n': 'namespace',
        \ 'c': 'class',
        \ 's': 'struct',
        \ 'u': 'union'
    \ },
    \ 'scope2kind': {
        \ 'enum' : 'g',
        \ 'namespace' : 'n',
        \ 'class' : 'c',
        \ 'struct': 's',
        \ 'union' : 'u'
    \}
\}
let g:tagbar_type_tex = {
    \ 'ctagstype' : 'tex',
    \ 'kinds'     : [
    \ 's:sections',
    \ 'g:graphics:0:0',
    \ 'l:labels',
    \ 'r:refs:1:0',
    \ 'p:pagerefs:1:0'
    \ ],
    \ 'sort'    : 0,
    \ 'deffile' : g:xvim_home."/conf/plugin/ctags/tex.cnf"
\ }
nmap <Leader>tl :TagbarToggle<cr>
