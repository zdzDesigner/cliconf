#!/bin/bash

curbuf=$(cat $CLIENV/.temp/bg)
# curnum=${curbuf%%@*}
cururl=${curbuf##*@}
# 壁纸
feh --bg-fill --no-fehbg $HOME/.bg/$cururl

# little battery
flag=0
function invert() {
    if [ $flag = 0 ]; then
        flag=1
    else
        flag=0
    fi
    return `expr $flag`
}

count=0

while true
do
    invert
	bash $CLIENV/dwm/scripts/dwm-status-refresh.sh $?
	sleep 1

    count=$[count+1]
    if [[ $[count%$[60*60]] == 0 ]]; then
    # if [[ $[count%$[60*30]] == 0 ]]; then
    # if [[ $[count%$[10]] == 0 ]]; then
        feh --recursive --randomize --bg-fill $HOME/.bg/green/*
        count=0
    fi
done
