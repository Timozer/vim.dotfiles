#!/bin/bash

destPath="$HOME/.vim"
SCRIPT_PATH=$(dirname $0)

install()
{
    if [ "$destPath"x != "$SCRITP_PATH"x ]
    then
        chmod -R o-w,g-w $SCRITP_PATH 
        cp -R $SCRITP_PATH $destPath 
        cd destPath
        mkdir .undofiles
        cp -R vim-lib-common/*.vim autoload
        cd -
        vim +PlugInstall
    fi
}

install_vim_plug()
{
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

install_arara()
{
    wget https://github.com/cereda/arara/releases/download/4.0/arara-4.0.zip
    mkdir arara
    unzip arara*.zip -d arara
    rm arara*.zip
    if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
        echo 'alias arara="java -jar ~/.vim/arara/arara.jar"' >> ~/.zshrc
        source ~/.zshrc
    elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
        echo 'alias arara="java -jar ~/.vim/arara/arara.jar"' >> ~/.bashrc
        source ~/.bashrc
    else
        echo 'I can not tell which shell you are using.'
    fi
}

function InstallGoLSP() {
    go get -u github.com/sourcegraph/go-langserver
}

function InstallBashLSP() {
    npm i -g bash-language-server
}

echo '#######################################'
echo '  '
echo ' Timozer vim configuration '
echo '  '
echo '#######################################'
echo '  '
echo '#######################################'
echo 'Installing timozer vim configuration...'
install

#InstallGoLSP
echo 'Done!'
