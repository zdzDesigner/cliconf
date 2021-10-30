#!/bin/bash

curbuf=$(cat $HOME/.bg/.temp)
# curnum=${curbuf%%@*}
cururl=${curbuf##*@}
# 壁纸
feh --bg-fill --no-fehbg $HOME/.bg/$cururl

flag=0
function invert() {
    if [ $flag = 0 ]; then
        flag=1
    else
        flag=0
    fi
    return `expr $flag`
}
while true
do
    invert
	bash /home/zdz/.zdz/dwm/scripts/dwm-status-refresh.sh $?
	sleep 2
done
