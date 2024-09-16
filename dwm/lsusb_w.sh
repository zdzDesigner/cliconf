#!/bin/bash

throttle_end=1;
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
        echo true
    else
        # 更新上次调用时间
        echo false
    fi
    echo $current_time > "$last_call_time_file"
}


# 磁盘挂载 ===============================
is_udisksctl=false
if command -v udisksctlx &> /dev/null; then
    is_udisksctl=true
fi
function mountDisk(){
    if [ $is_udisksctl == false ]; then 
      return 
    fi
    local is_disk=$1
    if [ $is_disk == true ]; then
        echo "添加USB设备$line"
    else
        echo "is_disk:$is_disk"
    fi
}
# ========================================


# 键盘 ===================================
function quickKeyboard(){
    local is_keyboard=$1
    if [ $is_keyboard == true ]; then
        quickey.sh
        echo "添加USB设备:xy_3dg12"
    else
        echo "is_keyboard:$is_keyboard"
    fi
}
# ========================================



# 监控USB设备插入和移除
udevadm monitor --subsystem-match=usb --property | while read -r line; do
    # echo "$line"
    # 检测到USB设备事件后运行lsusb
    if [[ "$line" == *"add"* || "$line" == *"remove"* ]]; then

      throttle_end=$(throttle 2)
      # echo "vvvv-$throttle_end"
      if [ $throttle_end == true ]; then
        sleep 1
        echo "USB设备更改检测到，更新设备列表："

        is_keyboard=false
        is_disk=false
        # 用管道 (|) 时，整个管道的输出会被送到子 shell 中执行 is_disk 在子shell中修改对当前无效
        # lsusb | while read -r line; do
        while read -r line; do
          if [[ "$line" == *"xy_3dg12"* ]]; then
              is_keyboard=true
          fi
          if [[ "$line" == *"Backup+ BK"* ]]; then
              is_disk=true
          fi
        done < <(lsusb) 
        # 业务 ================================
        ## 键盘
        quickKeyboard $is_keyboard
        ## 挂载
        mountDisk $is_disk

      fi
    fi
done

