#!/bin/bash

#!/bin/bash

if [[ ! -f ".temp" ]]; then
    echo "" > .temp
fi

curbuf=$(cat .temp)
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
                echo "1@$tarurl" > .temp
                break
            fi
            if [[ $1 == 0  ]]; then
                echo "1@$tarurl" > .temp
                break
            fi
            # echo ${f##*/}
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
