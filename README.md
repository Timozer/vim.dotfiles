```
 _____  __     ___
|_   _|_\ \   / (_)_ __ ___
  | |/ __\ \ / /| | '_ ` _ \
  | | (__ \ V / | | | | | | |
  |_|\___| \_/  |_|_| |_| |_|
```

# tcvim

这是我的 Vim 配置, 代码具体参考了哪个项目的, 我忘记了, 在此表示感谢.

# Vim Install

## Mac
```sh
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-python3interp \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-cscope \
            --enable-terminal \
            --enable-autoservername \
            --enable-luainterp
make -j4
sudo make install
```

更新版本

```sh
cd vim
git pull
make distclean
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-python3interp \
            --enable-perlinterp \
            --enable-luainterp \
            --enable-cscope \
            --enable-terminal \
            --enable-autoservername \
            --enable-luainterp
make -j4
sudo make install
```

安装到 `/usr/local/bin/` 下。

# Features

## Keymap

这个配置里的 Leader Key 设置为分号，即 `let mapleader=";"`。

快捷保存与退出：
```vim
nmap <Leader>q :q<CR>
nmap <Leader>w :w!<CR>
nmap <Leader>Q :qa<CR>
```

分割窗口后在窗口之间的跳转：
```vim
nnoremap <Leader>lw <C-W>l
nnoremap <Leader>hw <C-W>h
nnoremap <Leader>jw <C-W>j
nnoremap <Leader>kw <C-W>k
```

和系统剪贴板的交互：
```vim
vnoremap <Leader>y "+y
nnoremap <Leader>p "+p
nnoremap <Leader>yy "+yy
```
插入日期:
```vim
" for insert date
nnoremap <Leader>id :r!date "+\%Y-\%m-\%d \%H:\%M"<CR>
imap <Leader>id <ESC><Leader>idkJA
```

# Plugins

## vim-fswitch

```vim
" switch between .cpp and .h file
nnoremap <silent> <Leader>sw :FSHere<cr>
```

## ctrlsf
```vim
" plugin: ctrlsf.vim
let g:ctrlsf_case_sensitive = 'smart'
nnoremap <Leader>sf :CtrlSF<CR>
```

## multicursors
```vim
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
```
## gundo

```vim
noremap <Leader>ud :GundoToggle<CR>
```
# Install

```sh
git clone https://github.com/Timozer/tcvim.git ~/.vim
```
# Update Logs

2019-06-14 21:53

上个项目的迁移, 使用了 coc.nvim 作为补全插件

