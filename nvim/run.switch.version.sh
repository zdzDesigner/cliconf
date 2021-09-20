#!/bin/bash

DIR="$(pwd)/nvim"
PATH_VIM_LN="$DIR/init.vim"
PATH_VIM_V4="$DIR/v4/init.vim"
PATH_VIM_V5="$DIR/v5/init.vim"

function vimLn() {
    echo $(ls -l $PATH_VIM_LN)
}

if [ ! -f "$PATH_VIM_LN" ]; then 
    ln -s $PATH_VIM_V5 $PATH_VIM_LN
    echo $(vimLn)
    exit
fi


if [[ $(vimLn) =~ .*\/v4\/.* ]]; then
    if [ -f "$PATH_VIM_LN" ]; then 
        rm $PATH_VIM_LN
    fi
    ln -s $PATH_VIM_V5 $PATH_VIM_LN
    echo $(vimLn)

elif [[ $(vimLn) =~ .*\/v5\/.* ]]; then
    if [ -f "$PATH_VIM_LN" ]; then 
        rm $PATH_VIM_LN
    fi
    ln -s $PATH_VIM_V4 $PATH_VIM_LN
    echo $(vimLn)
fi
