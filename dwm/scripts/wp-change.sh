#!/bin/bash
TEMP_PATH=$HOME/.bg/.temp
if [[ ! -f $TEMP_PATH ]]; then
    echo "" > $TEMP_PATH
fi

curbuf=$(cat $TEMP_PATH)
echo $curbuf
curnum=${curbuf%%@*}
cururl=${curbuf##*@}
curnum=${curnum:-0}

echo $cururl
echo $curnum

function getwp() {
    tarurl=""
    declare -i count=0

    for f in $HOME/.bg/*
    do
        if [ -f "$f" ];then
            tarurl="${f##*/}"
            if [[ $count == 1 ]]; then
                echo "1@$tarurl" > $TEMP_PATH
                break
            fi
            if [[ $1 == 0  ]]; then
                echo "1@$tarurl" > $TEMP_PATH
                break
            fi

            if [[ $2 == $tarurl ]]; then
                count=1
            fi
        fi
    done
    echo $tarurl
}

ret=$(getwp $curnum $cururl)
echo ret: "$ret"
if [[ $ret == $cururl ]]; then
    echo "equl"
    ret=$(getwp 0 $cururl)
fi
echo ret rest: $ret






feh --bg-fill  $HOME/.bg/$ret
# feh --recursive --randomize --bg-fill $HOME/.bg/*
