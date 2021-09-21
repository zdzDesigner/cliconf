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
echo "link $PATH_NVIM_INIT_LN > $PATH_NVIM_INIT"



## terminator
PATH_TERMINATOR="$HOME/.config/terminator"
PATH_TERMINATOR_CONFIG_LN="$PATH_TERMINATOR/config"
PATH_TERMINATOR_CONFIG="$CLIENV/terminator/config"
ln -sf $PATH_TERMINATOR_CONFIG $PATH_TERMINATOR_CONFIG_LN
echo "link $PATH_TERMINATOR_CONFIG_LN > $PATH_TERMINATOR_CONFIG"



## gtk-3.0
PATH_GTK3_LN="$HOME/.config/gtk-3.0"
PATH_GTK3="$CLIENV/gtk-3.0"
if [ -s $PATH_GTK3_LN ]; then
    echo "$PATH_GTK3_LN is not empty, force replace new gtk3 (yes or no):"
    stdin
    echo "make sure remove $PATH_GTK3_LN (yse or no)"
    stdin
    rm -rf "$PATH_GTK3_LN"
fi
ln -sf $PATH_GTK3 $PATH_GTK3_LN
echo "link $PATH_GTK3_LN > $PATH_GTK3"





## ranger
PATH_RANGER="$HOME/.config/ranger"
PATH_RANGER_RC_LN="$PATH_RANGER/rc.conf"
PATH_RANGER_COMMANDS_LN="$PATH_RANGER/commands.py"
PATH_RANGER_RIFLE_LN="$PATH_RANGER/rifle.conf"
PATH_RANGER_SCOPE_LN="$PATH_RANGER/scope.sh"

PATH_RANGER_RC="$CLIENV/ranger/rc.conf"
PATH_RANGER_COMMANDS="$CLIENV/ranger/commands.py"
PATH_RANGER_RIFLE="$CLIENV/ranger/rifle.conf"
PATH_RANGER_SCOPE="$CLIENV/ranger/scope.sh"

ln -sf $PATH_RANGER_RC $PATH_RANGER_RC_LN
ln -sf $PATH_RANGER_COMMANDS $PATH_RANGER_COMMANDS_LN
ln -sf $PATH_RANGER_RIFLE $PATH_RANGER_RIFLE_LN
ln -sf $PATH_RANGER_SCOPE $PATH_RANGER_SCOPE_LN

echo "link $PATH_RANGER > $CLIENV/ranger"




## alacritty
PATH_ALACRITTY="$HOME/.config/alacritty"
PATH_ALACRITTY_CONFIG_LN="$PATH_ALACRITTY/alacritty.yml"
PATH_ALACRITTY_THEMES_LN="$PATH_ALACRITTY/.themes"
PATH_ALACRITTY_CONFIG="$CLIENV/alacritty/alacritty.yml"
PATH_ALACRITTY_THEMES="$CLIENV/alacritty/.themes"
if [ -s $PATH_ALACRITTY_THEMES_LN ]; then
    rm -rf "$PATH_ALACRITTY_THEMES_LN"
fi
ln -sf $PATH_ALACRITTY_CONFIG $PATH_ALACRITTY_CONFIG_LN
ln -sf $PATH_ALACRITTY_THEMES $PATH_ALACRITTY_THEMES_LN
echo "link $PATH_ALACRITTY > $CLIENV/alacritty"





## lazygit
PATH_LAZYGIT="$HOME/.config/lazygit"
PATH_LAZYGIT_CONFIG_LN="$PATH_LAZYGIT/config.yml"
PATH_LAZYGIT_CONFIG="$CLIENV/lazygit/config.yml"
ln -sf $PATH_LAZYGIT_CONFIG $PATH_LAZYGIT_CONFIG_LN
echo "link $PATH_LAZYGIT_CONFIG_LN > $PATH_LAZYGIT_CONFIG"




## tmux
PATH_TMUX="$HOME/.config/tmux"
PATH_TMUX_CONFIG_LN="$PATH_TMUX/.tmux.conf"
PATH_TMUX_CONFIG="$CLIENV/tmux/.tmux.conf"
ln -sf $PATH_TMUX_CONFIG $PATH_TMUX_CONFIG_LN
echo "link $PATH_TMUX_CONFIG_LN > $PATH_TMUX_CONFIG"




