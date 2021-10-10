#!/bin/bash

curbuf=$(cat $HOME/.bg/.temp)
# curnum=${curbuf%%@*}
cururl=${curbuf##*@}
# 壁纸
feh --bg-fill --no-fehbg $HOME/.bg/$cururl

while true
do
	bash /home/zdz/.zdz/dwm/scripts/dwm-status-refresh.sh
	sleep 2
done
