#!/bin/bash



function tmux-resurrect-reset-last() {
    cd ~/.tmux/resurrect && \
        ln -f -s $(/bin/ls -t tmux_resurrect_*.txt | head -n 1) last && \
        /bin/ls -l last
}


tmux-resurrect-reset-last
