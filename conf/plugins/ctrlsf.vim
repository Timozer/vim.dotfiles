" plugin: ctrlsf.vim
let g:ctrlsf_case_sensitive = 'smart'
nnoremap <Leader>sf :CtrlSF<CR>
let g:ctrlsf_ignore_dir = ['.git', '.idea']
let g:ctrlsf_position = 'right'
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_context = '-C 1'
let g:ctrlsf_auto_focus = {
            \ "at" : "start",
            \ "duration_less_than": 1000
            \ }
