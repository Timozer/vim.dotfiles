" plugin manager: plug --> https://github.com/junegunn/vim-plug


call plug#begin(g:xvim_home.'/plugged')
Plug 'yianwillis/vimcdoc'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" color scheme
Plug 'KeitaNakamura/neodark.vim'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" comment
Plug 'scrooloose/nerdcommenter'

" tag 
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'

Plug 'farmergreg/vim-lastplace'
Plug 'terryma/vim-multiple-cursors'
Plug 'Yggdroot/indentLine'
Plug 'Townk/vim-autoclose'

Plug 'dyng/ctrlsf.vim'
Plug 'SirVer/ultisnips'
Plug 'w0rp/ale'

Plug 'derekwyatt/vim-fswitch'
Plug 'derekwyatt/vim-protodef'

Plug 'vim-scripts/ag.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sjl/gundo.vim'

Plug 'junegunn/vim-easy-align'
Plug 'plasticboy/vim-markdown'

"Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'pseewald/vim-anyfold'
" complete
"Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install({'tag':1})}}

Plug 'Timozer/timozerSnips'
Plug 'Timozer/addfileheader'
call plug#end()

if has('termguicolors')
    set termguicolors
    colorscheme neodark
else
    colorscheme molokai
    let     g:rehash256 = 1
endif

let g:xplugins = [
    \ 'vim-airline',
    \ 'vim-airline-themes',
    \ 'nerdtree',
    \ 'nerdtree-git-plugin',
    \ 'nerdcommenter',
    \ 'tagbar',
    \ 'vim-surround',
    \ 'vim-lastplace',
    \ 'vim-multiple-cursors',
    \ 'indentLine',
    \ 'vim-autoclose',
    \ 'ctrlsf',
    \ 'ultisnips',
    \ 'ale',
    \ 'vim-fswitch',
    \ 'vim-protodef',
    \ 'ag',
    \ 'ctrlp',
    \ 'gundo',
    \ 'vim-easy-align',
    \ 'vim-markdown',
    \ 'vim-cpp-enhanced-highlight',
    \ 'vim-anyfold',
	"\ 'coc.nvim',
	\]

for s:xplugins in g:xplugins
    let s:plugconf_path = g:xvim_home."/conf/plugins/".s:xplugins.".vim"
    if filereadable(s:plugconf_path)
        exec ':so ' s:plugconf_path
    endif
endfor 

