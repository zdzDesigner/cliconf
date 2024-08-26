#!/bin/bash

ret=1;
# 定义节流函数
function throttle() {
    local last_call_time_file="/tmp/last_call_time"
    local wait_time=$1
    
    # 检查文件是否存在并读取上次调用的时间
    if [ -f "$last_call_time_file" ]; then
        last_call_time=$(cat "$last_call_time_file")
    else
        last_call_time=0
    fi

    # 获取当前时间
    current_time=$(date +%s)
    
    # 计算自上次调用后的时间差
    time_diff=$((current_time - last_call_time))
    
    
    # 如果时间差小于等待时间，则等待剩余的时间
    # if [ $time_diff -lt $wait_time ]; then
    if [ $time_diff -gt $wait_time ]; then
        # sleep $((wait_time - time_diff))
        echo 0
    else
        # 更新上次调用时间
        echo 1
    fi
    echo $current_time > "$last_call_time_file"
}
# 监控USB设备插入和移除
udevadm monitor --subsystem-match=usb --property | while read -r line; do
    # echo "$line"
    # 检测到USB设备事件后运行lsusb
    if [[ "$line" == *"add"* || "$line" == *"remove"* ]]; then
      ret=$(throttle 2)
      # echo "vvvv-$ret"
      if [ $ret == 0 ]; then
        sleep 1
        echo "USB设备更改检测到，更新设备列表："
        lsusb | while read -r line; do
          if [[ "$line" == *"xy_3dg12"* ]]; then
              quickey.sh
              echo "添加USB设备:xy_3dg12"
          fi
        done
      fi
    fi
done

