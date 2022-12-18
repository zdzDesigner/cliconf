#!/bin/bash

BG=$(cat $CLIENV/.temp/bg)
BG_NAME=${BG##*@}
# BG_DIR=$HOME/.bg/favorite
BG_DIR=$HOME/.bg/jz

# 壁纸
feh --bg-fill --no-fehbg $BG_DIR/$BG_NAME

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
  bash $CLIENV/dwm/scripts/dwm-status-refresh.sh $? > /dev/null 2>&1  # $? 获取invert执行的返回值
  # xsetroot -name $?
  sleep 1

  count=$[count+1]
  if [[ $[count%$[60*60]] == 0 ]]; then
    # if [[ $[count%$[60*30]] == 0 ]]; then
    # if [[ $[count%$[10]] == 0 ]]; then
    # feh --recursive --randomize --bg-fill $HOME/.bg/green/*
    feh --recursive --randomize --bg-fill $BG_DIR/*
    # feh --recursive --randomize --bg-fill $HOME/.bg/draw/*
    count=0
  fi
done
