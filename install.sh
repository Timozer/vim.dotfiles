#!/bin/bash

destPath="$HOME/.vim"
SCRIPT_PATH=$(dirname $0)

install_all() {
    # install ctags gtags
    pacman -S ctags global
    pacman -S nodejs npm
    pip3 install --user pynvim
}
install_all
