let g:xvim_home = fnamemodify(expand('<sfile>'), ':h')
lockvar g:xvim_home

let g:xvim_version = '0.0.1-dev'
lockvar g:xvim_version

" editing settings
let g:xvim_indent = 4
let g:xvim_expand_tab = 1

" mouse settings
let g:xvim_enable_mouse = 1
let g:xvim_mousehide = 1

let g:xvim_max_column = 80
let g:xvim_enable_guicolors = 0
let g:xvim_sidebar_width = 30
let g:xvim_enable_cursorline = 1
let g:xvim_enable_cursorcolumn = 0
let g:xvim_statusline_separator = 'nil'
let g:xvim_error_symbol            = '✖'
let g:xvim_warning_symbol          = '⚠'
let g:xvim_help_language = 'cn'
let g:xvim_colorscheme = ''
let g:xvim_colorscheme_bg = 'dark'
let g:xvim_filetree_direction = 'left'
let g:xvim_sidebar_direction = ''
let g:xvim_log_level = 3

let g:xvim_data_dir = g:xvim_home . "/.data"

let g:xvim_plugins_dir = g:xvim_home . "/.plugins"

let g:xvim_plugins = {
        \ "gruvbox": {
            \ "repo": "morhetz/gruvbox",
            \ "enable": 1,
            \ },
        \ "vimcdoc": {
            \ "repo": "yianwillis/vimcdoc",
            \ "enable": 1,
            \ },
        \ "vim-startify" : {
            \ "repo": "mhinz/vim-startify",
            \ "enable": 1,
            \ },
        \ "vim-airline": {
            \ "repo": "vim-airline/vim-airline",
            \ "enable": 1,
            \ },
        \ "vim-airline-themes": {
            \ "repo": "vim-airline/vim-airline-themes",
            \ "enable": 1,
            \ },
        \ "defx": {
            \ "repo": 'Shougo/defx.nvim',
            \ "enable": 1,
            \ },
        \ "nvim-yarp": {
            \ "repo": 'roxma/nvim-yarp',
            \ "enable": 1,
            \ },
        \ "vim-hug-neovim-rpc": {
            \ "repo": 'roxma/vim-hug-neovim-rpc',
            \ "enable": 1,
            \ },
        \ "nerdcommenter": {
            \ "repo": "scrooloose/nerdcommenter",
            \ "enable": 1,
            \ "before": 1,
            \ },
        \ "indentLine": {
            \ "repo": "Yggdroot/indentLine",
            \ "enable": 1,
            \ },
        \ "coc": {
            \ "repo": "neoclide/coc.nvim",
            \ "enable": 1,
            \ "options": {"merged": 0, "rev": "release"},
            \ },
        \ "ultisnips": {
            \ "repo": "SirVer/ultisnips",
            \ "enable": 1,
            \ },
        \ "vim-visual-multi": {
            \ "repo": "mg979/vim-visual-multi",
            \ "enable": 1,
            \ },
        \ "auto-pairs": {
            \ "repo": "jiangmiao/auto-pairs",
            \ "enable": 1,
            \ },
        \ "vim-surround": {
            \ "repo": "tpope/vim-surround",
            \ "enable": 1,
            \ },
        \ "vim-easy-align": {
            \ "repo": "junegunn/vim-easy-align",
            \ "enable": 1,
            \ },
        \ "LeaderF": {
            \ "repo": "Yggdroot/LeaderF",
            \ "enable": 1,
            \ "options": {"build": "./install.sh"},
            \ },
        \ "gen_tags": {
            \ "repo": "jsfaint/gen_tags.vim",
            \ "enable": 1,
            \ },
        \ "vim-signify": {
            \ "repo": "mhinz/vim-signify",
            \ "enable": 1,
            \ "options": {"rev": "legacy"},
            \ },
        \ "vim-projectionist": {
            \ "repo": "tpope/vim-projectionist",
            \ "enable": 1,
            \ },
        \ "ctrlsf": {
            \ "repo": "dyng/ctrlsf.vim",
            \ "enable": 1,
            \ },
    \ }

"Plug 'kana/vim-textobj-user'
"Plug 'kana/vim-textobj-indent'
"Plug 'kana/vim-textobj-syntax'
"Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
"Plug 'sgur/vim-textobj-parameter'
"" tag 
"Plug 'farmergreg/vim-lastplace'

"Plug 'w0rp/ale'

"Plug 'derekwyatt/vim-protodef'

"Plug 'vim-scripts/ag.vim'
"Plug 'sjl/gundo.vim'

"Plug 'plasticboy/vim-markdown'

""Plug 'octol/vim-cpp-enhanced-highlight'

"Plug 'pseewald/vim-anyfold'

"Plug 'Timozer/timozerSnips'
"Plug 'Timozer/addfileheader'
call xvim#begin()
call xvim#end()
