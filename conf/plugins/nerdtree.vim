" plugin: nerdtree
" auto open a NERDTree when vim starts up if no files were specified
au  StdinReadPre * let s:std_in = 1
au  VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nmap <Leader>fl :NERDTreeToggle<CR>
let NERDTreeWinSize=34
let NERDTreeWinPos="left"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

