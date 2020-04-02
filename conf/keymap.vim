" =============================================================================
" Keys map
" define the map leader
let mapleader=","
let maplocalleader=' '

" save and quit
nmap <Leader>q :q<CR>
nmap <Leader>w :w!<CR>
nmap <Leader>Q :qa<CR>

" {move} between split windows
" left, right, top, bottom window jump
nnoremap <Leader>lw <C-W>l
nnoremap <Leader>hw <C-W>h
nnoremap <Leader>jw <C-W>j
nnoremap <Leader>kw <C-W>k

" managing tabs
map <Leader>tc :tabclose<CR>

" copy to system clipboard and paste from system clipboard
vnoremap <Leader>y "+y
nnoremap <Leader>p o<ESC>"+p
nnoremap <Leader>yy "+yy

" for buffers
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>

" for insert date
nnoremap <Leader>id :r!date "+\%Y-\%m-\%d \%H:\%M"<CR>
imap <Leader>id <ESC><Leader>idkJA

" wrapped lines goes down/up to next row, rather than next line in file
noremap j gj
noremap k gk

