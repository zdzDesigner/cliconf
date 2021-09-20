
" kibana ot server log: java push asr result
function! KibanaLogFormat_OT()
    " :g!/msg/d
    :g!/raw.*msg.*/d
    :%s/^.*msg\\":\\"//g
    :%s/\\n\|\\//g
    :%s/,"event":"record.input.text".*$/},/g
    " :%s/"}"$/,/g
    " :%s/"}",$/,/g
    " :%s/,"event":"record.input.text"//g
    :nohlsearch
endfunction
