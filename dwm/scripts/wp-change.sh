#!/bin/bash

direc=$1
direc=${direc:-"asc"}

TEMP_PATH=$CLIENV/.temp/bg
if [[ ! -f $TEMP_PATH ]]; then
    echo "" > $TEMP_PATH
fi

curbuf=$(cat $TEMP_PATH)
echo "temppath::" $curbuf

curnum=${curbuf%%@*}
cururl=${curbuf##*@}
cururl=${cururl:-"xxxxxxx"}
echo "tempbg::" $cururl
curnum=${curnum:-0}

echo $cururl
echo $curnum

function getwp() {

    curnum=$1
    cururl=$2
    direc=$3
    tempurl=""
    headurl=""
    tailurl=""
    preurl=""
    equrl=""
    nexturl=""

    declare -i count=0

    for f in $HOME/.bg/*
    do
        if [ -f "$f" ];then
            tempurl="${f##*/}"
            # echo "tempurl::$count::" $tempurl
            # head
            if [ $count = 0 ]; then
                headurl=$tempurl
            fi

            if [ ! -z $equrl ]; then
                # echo "nexturl::" $tempurl
                nexturl=$tempurl
                break
            fi

            if [[ $cururl == $tempurl ]] ; then
                # resolve:: direction is desc first bug
                if [[ $direc == "asc" ]] || ([[ $direc == "desc" ]] && [[ $count > 0 ]]); then
                    # echo "equrl::" $tempurl
                    equrl=$tempurl
                fi
            else
                preurl=$tempurl
            fi
            # tail
            tailurl=$tempurl
            count=$[count+1]
        fi
    done
    # next
    if [ $direc == "asc" ]; then
        if [ ! -z $nexturl ]; then
            echo "$count@$nexturl" > $TEMP_PATH
            echo $nexturl
            return
        fi

        echo "$count@$headurl" > $TEMP_PATH
        echo $headurl
        return
    fi
    
    if [ $direc == "desc" ]; then
        if [ ! -z $preurl ]; then
            echo "$count@$preurl" > $TEMP_PATH
            echo $preurl
            return
        fi
        # echo "$count@$tailurl" > $TEMP_PATH
        # echo $tailurl
        # return
    fi
}

ret=$(getwp $curnum $cururl $direc)
echo ret: "$ret"
# last bg, reset 0
# if [[ $ret == $cururl ]]; then
#     echo "equl"
#     ret=$(getwp 0 $cururl)
# fi
# echo ret rest: $ret






feh --bg-fill  $HOME/.bg/$ret
# feh --recursive --randomize --bg-fill $HOME/.bg/*
