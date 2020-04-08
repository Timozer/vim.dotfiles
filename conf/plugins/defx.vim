call defx#custom#option('_', {
    \ 'columns': 'mark:indent:icon:filename:type',
    \ 'winwidth': 30,
    \ 'split': 'vertical',
    \ 'direction': 'leftabove',
    \ 'show_ignored_files': 1,
    \ 'buffer_name': '',
    \ 'toggle': 1,
    \ 'resume': 1
    \ })

call defx#custom#column('icon', {
            \ 'directory_icon': '▶',
            \ 'opened_icon': '▼',
            \ 'root_icon': ' ',
            \ })

augroup filetreeinit
    au!
    autocmd FileType defx call s:defx_init()
    " auto close last defx windows
    autocmd BufEnter * nested if
                \ (!has('vim_starting') && winnr('$') == 1
                \ && &filetype ==# 'defx') |
                \ q | endif
augroup END

nnoremap <Leader>fl :Defx<CR>

function! s:defx_init()
    " Define mappings
    nnoremap <silent><buffer><expr> q
                \ defx#do_action('quit')

    nnoremap <silent><buffer><expr> x
                \ defx#do_action('execute_system')

    " open file
    nnoremap <silent><buffer><expr> v
                \ defx#do_action('drop', 'vsplit')
    nnoremap <silent><buffer><expr> s
                \ defx#do_action('drop', 'split')
    nnoremap <silent><buffer><expr> t
                \ defx#do_action('drop', 'tabedit')

    nnoremap <silent><buffer><expr> <C-n>d
                \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> <C-n>f
                \ defx#do_action('new_file')

    nnoremap <silent><buffer><expr> '
                \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> "
                \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> c
                \ defx#do_action('clear_select_all')

    nnoremap <silent><buffer><expr> <C-c>
                \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> <C-x>
                \ defx#do_action('move')
    nnoremap <silent><buffer><expr> <C-v>
                \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> <Del>
                \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> <BS>
                \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> <C-r>
                \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> yy defx#do_action('call', 'DefxYarkPath')

    " file tree open and close
    nnoremap <silent><buffer><expr> <Cr>
                \ defx#is_directory() ?
                \   defx#do_action('open_or_close_tree')
                \   : defx#do_action('drop')
    nnoremap <silent><buffer><expr> h defx#do_action('call', 'DefxSmartH')
    " directory in and directory out, go to home directory
    nnoremap <silent><buffer><expr> i
                \ defx#is_directory() ?
                \ defx#do_action('open_directory') : Nop
    nnoremap <silent><buffer><expr> o
                \ defx#do_action('cd', '..')
    nnoremap <silent><buffer><expr> ~
                \ defx#do_action('cd')

    nnoremap <silent><buffer><expr> <C-h>
                \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> <C-r>
                \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
                \ defx#do_action('print')

    nnoremap <silent><buffer><expr> j
                \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
                \ line('.') == 1 ? 'G' : 'k'
    " TODO: <C-j> <C-k> to jump between brothers

    nnoremap <silent><buffer><expr> > defx#do_action('resize',
                \ defx#get_context().winwidth + 5)
    nnoremap <silent><buffer><expr> < defx#do_action('resize',
                \ defx#get_context().winwidth - 5)
endf

function! DefxYarkPath(_) abort
  let candidate = defx#get_candidate()
  let @+ = candidate['action__path']
  echo 'yanked: ' . @+
endfunction

function! DefxSmartH(_)
  " candidate is opend tree?
  if defx#is_opened_tree()
    return defx#call_action('close_tree')
  endif

  " parent is root?
  let s:candidate = defx#get_candidate()
  let s:parent = fnamemodify(s:candidate['action__path'], s:candidate['is_directory'] ? ':p:h:h' : ':p:h')

  " move to parent.
  call defx#call_action('search', s:parent)
endfunction
