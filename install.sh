#!/bin/bash

# check environment
if [ -z $CLIENV ]; then
    echo "\$CLIENV is empty, pleace set CLIENV env; CLIENV is current dir path."
    exit
fi

function stdin() {
    read STDIN
    if [ "$STDIN" != "yes" ] && [ "$STDIN" != "Y" ] && [ "$STDIN" != "y" ]; then
        echo "exit."
        exit
    fi
}


## nvim
PATH_NVIM="$HOME/.config/nvim"
PATH_NVIM_INIT_LN="$PATH_NVIM/init.vim"
PATH_NVIM_INIT="$CLIENV/nvim/init.vim"
ln -sf $PATH_NVIM_INIT $PATH_NVIM_INIT_LN



## terminator
PATH_TERMINATOR="$HOME/.config/terminator"
PATH_TERMINATOR_CONFIG_LN="$PATH_TERMINATOR/config"
PATH_TERMINATOR_CONFIG="$CLIENV/terminator/config"
ln -sf $PATH_TERMINATOR_CONFIG $PATH_TERMINATOR_CONFIG_LN



## gtk-3.0
PATH_GTK3_LN="$HOME/.config/gtk-3.0"
PATH_GTK3="$CLIENV/gtk-3.0"
if [ -s $PATH_GTK3_LN ]; then
    echo "$PATH_GTK3_LN is not empty, force replace new gtk3 (yes or no):"
    stdin
    echo "make sure remove $PATH_GTK3_LN."
    stdin
    rm -f "$PATH_GTK3_LN"
fi
echo $PATH_GTK3_LN
ln -sf $PATH_GTK3 $PATH_GTK3_LN





## ranger
PATH_RANGER="$HOME/.config/ranger"
PATH_RANGER_RC_LN="$PATH_RANGER/rc.conf"
PATH_RANGER_COMMANDS_LN="$PATH_RANGER/comments.py"
PATH_RANGER_RIFLE_LN="$PATH_RANGER/rifle.conf"
PATH_RANGER_SCOPE_LN="$PATH_RANGER/scope.sh"

PATH_RANGER_RC="$CLIENV/ranger/rc.conf"
PATH_RANGER_COMMANDS="$CLIENV/ranger/commands.py"
PATH_RANGER_RIFLE="$CLIENV/ranger/rifle.conf"
PATH_RANGER_SCOPE="$CLIENV/ranger/scope.sh"
echo $PATH_RANGER
ln -sf $PATH_RANGER_RC $PATH_RANGER_RC_LN
ln -sf $PATH_RANGER_COMMANDS $PATH_RANGER_COMMANDS_LN
ln -sf $PATH_RANGER_RIFLE $PATH_RANGER_RIFLE_LN
ln -sf $PATH_RANGER_SCOPE $PATH_RANGER_SCOPE_LN






