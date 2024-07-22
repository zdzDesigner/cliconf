#!/bin/bash

# LISTEN_FILE=/home/zdz/Documents/Try/Go/music/player/.fsnotify
LISTEN_FILE=/home/zdz/.zdz/.ctrl_player




if [[ $1 == "-next" ]]; then
  echo "P" > $LISTEN_FILE
  exit
fi

if [[ $1 == "-prev" ]]; then
  echo "O" > $LISTEN_FILE
  exit
fi
if [[ $1 == "-forward" ]]; then
  echo "H" > $LISTEN_FILE
  exit
fi

if [[ $1 == "-backward" ]]; then
  echo "\"" > $LISTEN_FILE
  exit
fi

if [[ $1 == "-pause" ]]; then
  cur=$(cat $LISTEN_FILE)
  if [[ $cur == 'S' ]]; then
  echo "R" > $LISTEN_FILE
  else
  echo "S" > $LISTEN_FILE
  fi
  exit
fi
