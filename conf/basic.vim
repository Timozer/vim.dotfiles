" ============================================================================= 
" General
set nocompatible 

if !lib#common#IsWindows()
    set shell=/bin/sh
endif

if lib#common#IsWindows()
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

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
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set nojoinspaces

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
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" mouse
set mouse=a
set mousehide 

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
set showcmd
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
" for regular expressions turn magic on
set magic 

set     tw=80
set     colorcolumn=81

" file type
filetype on
filetype plugin on
filetype indent on

" syntax high light
syntax enable
syntax on

" backup
if has("vms")
    set nobackup
else
    set backup
    set noswapfile
endif

set undofile
set undolevels=1000
set undoreload=1000

set splitright

" undofile
set undodir=g:xvim_home."/.undofiles/"

" help language
if version >= 603
    set helplang=cn
endif

" detect os type
" the value of g:os is Darwin for MacOS, Linux and Windows
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif


