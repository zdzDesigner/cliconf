#!/bin/bash

DIR="$(pwd)"
PATH_VIM_LN="$DIR/init.vim"
PATH_VIM_V4="$DIR/v4/init.vim"
PATH_VIM_V5="$DIR/v5/init.vim"
PATH_VIM_V6="$DIR/v6/init.vim"

function vimLn() {
    echo $(ls -l $PATH_VIM_LN)
}

# 设置最新版本
if [ ! -f "$PATH_VIM_LN" ]; then 
    ln -s $PATH_VIM_V6 $PATH_VIM_LN
    echo $(vimLn)
    exit
fi


# 设置固定版本
PATH_VAR=$(eval echo '$PATH_VIM_'$1)
if [[ $PATH_VAR ]]; then
    if [ -f "$PATH_VIM_LN" ]; then 
        rm $PATH_VIM_LN
    fi
    ln -s $PATH_VAR $PATH_VIM_LN
    echo $(vimLn)
fi

