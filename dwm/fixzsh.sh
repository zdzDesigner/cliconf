#!/usr/bin/env sh
cd ~
mv .zsh_history .zsh_history_bad
strings -eS .zsh_history_bad > .zsh_history




