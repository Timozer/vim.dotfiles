let g:startify_session_dir = g:xvim_data_dir . '/session'
if finddir(g:startify_session_dir) ==# ''
    silent call mkdir(g:startify_session_dir, 'p', 0700)
endif

let g:startify_custom_header = [
    \ '',
    \ '',
    \ '       /$$   /$$ /$$    /$$ /$$',
    \ '      | $$  / $$| $$   | $$|__/',
    \ '      |  $$/ $$/| $$   | $$ /$$ /$$$$$$/$$$$',
    \ '       \  $$$$/ |  $$ / $$/| $$| $$_  $$_  $$',
    \ '        >$$  $$  \  $$ $$/ | $$| $$ \ $$ \ $$',
    \ '       /$$/\  $$  \  $$$/  | $$| $$ | $$ | $$',
    \ '      | $$  \ $$   \  $/   | $$| $$ | $$ | $$',
    \ '      |__/  |__/    \_/    |__/|__/ |__/ |__/',
    \ '               version: ' . g:xvim_version,
    \ '',
\ ]

let g:startify_files_number = 5
let g:startify_lists = [
    \ { 'type': 'files',     'header': ['   MRU']            },
    \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    "\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    "\ { 'type': 'commands',  'header': ['   Commands']       },
\ ]

let g:startify_update_oldfiles = 1
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
let g:startify_skiplist = [
    \ 'COMMIT_EDITMSG',
    \ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc',
    \ 'bundle/.*/doc',
\ ]
let g:startify_fortune_use_unicode = 1
let g:startify_padding_left = 3
let g:startify_disable_at_vimenter = 0
let g:startify_relative_path = 1

autocmd FileType startify setl nowrap
