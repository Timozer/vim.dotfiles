```
           /$$   /$$  /$$                                                       /$$    /$$ /$$
          | $$  / $$ | $$                                                      | $$   | $$|__/
  /$$$$$$ |  $$/ $$//$$$$$$    /$$$$$$   /$$$$$$  /$$$$$$/$$$$   /$$$$$$       | $$   | $$ /$$ /$$$$$$/$$$$
 /$$__  $$ \  $$$$/|_  $$_/   /$$__  $$ /$$__  $$| $$_  $$_  $$ /$$__  $$      |  $$ / $$/| $$| $$_  $$_  $$
| $$$$$$$$  >$$  $$  | $$    | $$  \__/| $$$$$$$$| $$ \ $$ \ $$| $$$$$$$$       \  $$ $$/ | $$| $$ \ $$ \ $$
| $$_____/ /$$/\  $$ | $$ /$$| $$      | $$_____/| $$ | $$ | $$| $$_____/        \  $$$/  | $$| $$ | $$ | $$
|  $$$$$$$| $$  \ $$ |  $$$$/| $$      |  $$$$$$$| $$ | $$ | $$|  $$$$$$$         \  $/   | $$| $$ | $$ | $$
 \_______/|__/  |__/  \___/  |__/       \_______/|__/ |__/ |__/ \_______/          \_/    |__/|__/ |__/ |__/
```

# 关于 eXtreme Vim(XVim)

eXtreme Vim 简称 XVim，以下使用 XVim 代替 eXtreme Vim，是我个人的 Vim 配置。
它通过一些插件来使 Vim 提供一个类 IDE 的编辑特性。

XVim 受到了 [SpaceVim](https://github.com/SpaceVim/SpaceVim) 的启发，但是其核心
思想和实现方式不同。

XVim 的核心思想是: 

- **记忆辅助，肌肉记忆为主**，所有快捷键，都需要用户自己记住，以肌肉记忆为主，
若是无法记起某个功能，则需要记忆 TODO:
- 可视化交互
- **唯我主义**，我不要你觉得，我要我觉得。XVim 里的所有特性都是以我个人喜好
  来决定的。
- **极简主义**，尽可能不增加复杂性，代码都通俗易懂。

XVim 的实现方式和 [SpaceVim](https://github.com/SpaceVim/SpaceVim) 有所不同，
SpaceVim 加入了层(layer)的概念，而 XVim 没有新增任何概念，使用的都是 Vim 固有的
概念，不会增加复杂性，方便用户微调。

# 需求

- Vim 版本 802 以上，因为有的插件要使用浮动窗口; 
- +python3，因为有的插件使用 python 开发的，python2 我没有测试，不知道能不能用; 

# 源码编译安装 Vim

## Mac(or Linux) -> Linux 没有测试，不知道行不行，如果有测试过的小伙伴，可以告诉我
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

# 特性

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

