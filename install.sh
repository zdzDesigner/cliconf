#!/bin/bash
PATH_HOME="$HOME"
PATH_CUR="$(pwd)"

## nvim
PATH_NVIM="$PATH_HOME/.config/nvim"
PATH_NVIM_INIT_LN="$PATH_NVIM/init.vim"
PATH_NVIM_INIT="$PATH_CUR/nvim/init.vim"

$(ln -s $PATH_NVIM_INIT $PATH_NVIM_INIT_LN)
