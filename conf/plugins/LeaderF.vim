let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_ShortcutF = '<leader>ff'
let g:Lf_ShortcutB = '<leader>fb'
let g:Lf_CacheDirectory = g:xvim_data_dir . '/leaderf'

let g:Lf_WildIgnore = {
            \ 'dir': ['.git', '.svn', '.idea'],
            \ 'file': ['*~', '*.bak', '*.exe', '*.so']
            \}

let g:Lf_MruFileExclude = ['*.so']

"let g:Lf_Ctags = "/usr/local/universal-ctags/ctags"
"
"let g:Lf_CtagsFuncOpts = {
            "\ 'c': '--c-kinds=fp',
            "\ 'rust': '--rust-kinds=f',
            "\ }
let g:Lf_PreviewCode = 1

let g:Lf_PreviewResult = {
            \ 'File': 0,
            \ 'Buffer': 0,
            \ 'Mru': 0,
            \ 'Tag': 0,
            \ 'BufTag': 1,
            \ 'Function': 1,
            \ 'Line': 0,
            \ 'Colorscheme': 0,
            \ 'Rg': 0,
            \ 'Gtags': 0
            \}

let g:Lf_DefaultMode = 'Fuzzy'
