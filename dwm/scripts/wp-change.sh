#!/bin/bash

direc=$1              # 取方向参数
direc=${direc:-"asc"} # 默认递增

PATH_BG=jz
# PATH_BG=draw
TEMP_PATH=$CLIENV/.temp/bg   # 缓存的图片名文件
if [[ ! -f $TEMP_PATH ]]; then
  echo "" > $TEMP_PATH     # 没有生成个空文件
fi

curbuf=$(cat $TEMP_PATH)     # 读取文件中的内容 8@159402.png
echo "temppath::" $curbuf

curnum=${curbuf%%@*}         # 图片编号
cururl=${curbuf##*@}         # 图片名称
cururl=${cururl:-"sui-ji-shu"}  # 默认名称
echo "tempbg::" $cururl
curnum=${curnum:-0}          # 默认编号

echo $cururl
echo $curnum

function getwp() {
  curnum=$1   # 下标
  cururl=$2   # 当前文件名
  direc=$3    # 方向
  tempurl=""  # 临时文件名
  headurl=""  # 头
  preurl=""   # 前一个
  equrl=""    # 命中缓存
  nexturl=""  # 后一个

  declare -i count=0   # 计数, curnum

  for f in $HOME/.bg/$PATH_BG/*   # 是文件
  do
    if [ -f "$f" ];then
      tempurl="${f##*/}"  # 取图片名
      # echo "tempurl::$count::" $tempurl
      if [ $count = 0 ]; then  # 记录第一个
        headurl=$tempurl
      fi

      if [ ! -z $equrl ]; then # 命中缓存
        # echo "nexturl::" $tempurl
        nexturl=$tempurl  # 当前的元素刚好是缓存的下一个
        break
      fi

      if [[ $cururl == $tempurl ]] ; then
        # resolve:: direction is desc first bug
        if [[ $direc == "asc" ]] || ([[ $direc == "desc" ]] && [[ $count > 0 ]]); then
          # echo "equrl::" $tempurl
          equrl=$tempurl
        fi
      else
        preurl=$tempurl   # 未命中缓存都是上一个
      fi
      count=$[count+1]
    fi
  done

  if [ $direc == "asc" ]; then # next
    if [ ! -z $nexturl ]; then
      echo "$count@$nexturl" > $TEMP_PATH
      echo $nexturl
      return
    fi
  fi

  if [ $direc == "desc" ]; then # prev
    if [ ! -z $preurl ]; then
      echo "$count@$preurl" > $TEMP_PATH
      echo $preurl
      return
    fi
  fi

  echo "$count@$headurl" > $TEMP_PATH  # 未命中缓存, 取第一个
  echo $headurl
  return
}

ret=$(getwp $curnum $cururl $direc)
echo ret: "$ret"
# last bg, reset 0
# if [[ $ret == $cururl ]]; then
#     echo "equl"
#     ret=$(getwp 0 $cururl)
# fi
# echo ret rest: $ret






feh --bg-fill  $HOME/.bg/$PATH_BG/$ret
# feh --recursive --randomize --bg-fill $HOME/.bg/*
