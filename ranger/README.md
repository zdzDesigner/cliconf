# fzf config  commands.py
> fzf_select
# set default editor rifle.conf
> mime ^text,  label editor = /home/zdz/Application/neovim/v5/nvim.appimage -- "$@"


## toggle hidden file
> zh
> backspace


## filtered select
> zf exp   <enter>
> select



## cd dir and exit ranger 
alias ra='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
