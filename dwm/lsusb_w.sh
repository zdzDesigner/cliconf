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



# 文件存在 ===============================
function isExist(){
  if ls $1 > /dev/null 2>&1; then
      echo true
      return
  fi
  echo false
}
# ========================================

# 磁盘挂载 ===============================
is_udisksctl=false
if command -v udisksctl &> /dev/null; then
    is_udisksctl=true
fi
is_disk_mount=false
function mountDisk(){
    echo "/dev/sdb::$(isExist /dev/sdb)"
    if ! $(isExist /dev/sdb);then
      return
    fi
    if [ $is_udisksctl == false ]; then 
      return 
    fi
    local is_disk=$1
    if [ $is_disk == true ]; then
        echo "添加USB设备::DISK"
        is_disk_mount=true
        # sudo udisksctl mount --no-user-interaction -b /dev/sdb2
    elif [ $is_disk_mount == true ];then
        echo "移除USB设备is_disk:$is_disk"
        is_disk_mount=false
        # sudo udisksctl unmount --no-user-interaction -b /dev/sdb2
        # sudo udisksctl power-off --no-user-interaction -b /dev/sdb2
    fi
    echo "is_disk_mount:$is_disk_mount"
}
# ========================================


# 键盘 ===================================
is_keyboard_mount=false
function quickKeyboard(){
    local is_keyboard=$1
    if [ $is_keyboard == true ]; then
        is_keyboard_mount=true
        quickey.sh
        echo "添加USB设备::KEY_BOARD:xy_3dg12"
    elif [ $is_keyboard_mount == true ];then
        is_keyboard_mount=false
        echo "删除USB设备::KEY_BOARD:is_keyboard:$is_keyboard"
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
        # echo "is_mounted:$is_disk_mount,$is_disk"
        if [ $is_keyboard_mount != $is_keyboard ];then
            quickKeyboard $is_keyboard
        fi
        # if [ $is_keyboard_mount != $is_keyboard ];then
        #     quickKeyboard $is_keyboard
        # ## 挂载
        # elif [ $is_disk_mount != $is_disk ];then
        #     mountDisk $is_disk
        # fi
        # =====================================

      fi
    fi
done

