" General
set nocompatible 

"if !lib#common#IsWindows()
    "set shell=/bin/sh
"endif

"if lib#common#IsWindows()
    "set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
"endif

" encoding
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,gbk,cp936,gb2312,gb18030
scriptencoding utf-8

" autoread
set autoread 
set novisualbell 

" autowrite
set shortmess=aoOtTI
set viewoptions=folds,options,cursor,unix,slash
set virtualedit=onemore
set history=1000
set spell
set hidden
set iskeyword-=.,#,-


" editing
set smartindent
exec "set tabstop=" . g:xvim_indent
exec "set softtabstop=" . g:xvim_indent
exec "set shiftwidth=" . g:xvim_indent
if g:xvim_expand_tab
    set expandtab
endif
set smarttab
set nojoinspaces
set nowrap

" set search functions
set hlsearch
set incsearch
set ignorecase
set smartcase


" set fold
set foldcolumn=2
set foldmethod=indent
set foldlevel=2
set foldenable

" mouse
if g:xvim_enable_mouse
    set mouse=a
    if g:xvim_mousehide
        set mousehide 
    endif
endif

" pop menu
set wildmenu 
"set wildmode=longest:full
"set cot-=preview
"
set ttimeoutlen=0
set cul
set cuc
set number
set ruler
set noshowcmd
set go=
set scrolloff=3
set cmdheight=2
" cmd line
set laststatus=2

" confirm when quit without write
set confirm
set report=0

set showmatch
set matchtime=1
set backspace=indent,eol,start
set nrformats-=octal
set list
"set listchars=tab:→\ ,eol:↵,trail:•,extends:↷,precedes:↶,nbsp:.
set listchars=tab:›\ ,eol:↵,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
" for regular expressions turn magic on
set magic 

exec "set tw=" . g:xvim_max_column
exec "set colorcolumn=" . (g:xvim_max_column + 1)

" syntax highlight
syntax enable
syntax on

set splitright

" help language
if g:xvim_help_language !=# 'en' && version >= 603
    exec "set helplang=" . g:xvim_help_language
endif

set noswapfile
" backup 
if finddir(g:xvim_data_dir . "/backup") ==# ''
    silent call mkdir(g:xvim_data_dir . "/backup", "p", 0700)
endif
set backup
exec "set backupdir=" . g:xvim_data_dir . "/backup"
set nowritebackup

" undofile
if finddir(g:xvim_data_dir . "/undofile") ==# ''
    silent call mkdir(g:xvim_data_dir . "/undofile", "p", 0700)
endif
set undofile
set undolevels=1000
exec "set undodir=" . g:xvim_data_dir . "/undofile"

exec "set viewdir=" . g:xvim_data_dir . "/view"
set viewoptions-=options

set sessionoptions-=options

set tags=./.tags;,.tags
