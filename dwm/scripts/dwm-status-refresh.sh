#!/bin/bash
# Screenshot: http://s.natalian.org/2013-08-17/dwm_status.png
# Network speed stuff stolen from http://linuxclues.blogspot.sg/2009/11/shell-script-show-network-speed.html
rval=$1
rval=${rval:-0}

TEMP_STATUS=$CLIENV/.tmp/dwmbar
if [[ ! -f $TEMP_STATUS ]]; then
  echo "" > $TEMP_STATUS
fi


function getbrightness() {
  # .
  # echo "☀$(($(cat /sys/class/backlight/intel_backlight/brightness)/150))%"
  # echo ".$(($(bash brightness.sh)/150))%"
  echo ".$(($(bash brightness.sh)/15))%"
  # echo "$(($(cat /sys/class/backlight/intel_backlight/brightness)/15))%"
}


function enp() {
  enpinfo=$(ip link show enp0s31f6)
  if [[ "$enpinfo" =~ "state UP" ]]; then
    echo ".enp0s31f6"
    exit
  fi
  echo ""
}

function wifi() {
  # nmtui-connect :: 设置链接工具
  # Tx-Power
  # wlp61s0   IEEE 802.11  ESSID:off/any
  #           Mode:Managed  Access Point: Not-Associated   Tx-Power=off
  #           Retry short limit:7   RTS thr:off   Fragment thr:off
  #           Power Management:on
  #
  # wlp61s0   IEEE 802.11  ESSID:off/any
  #           Mode:Managed  Access Point: Not-Associated   Tx-Power=22 dBm
  #           Retry short limit:7   RTS thr:off   Fragment thr:off
  #           Power Management:on
  #
  # wlp61s0   IEEE 802.11  ESSID:"lmy"
  #           Mode:Managed  Frequency:2.437 GHz  Access Point: 44:55:C4:90:A3:B8
  #           Bit Rate=300 Mb/s   Tx-Power=22 dBm
  #           Retry short limit:7   RTS thr:off   Fragment thr:off
  #           Power Management:on
  #           Link Quality=62/70  Signal level=-48 dBm
  #           Rx invalid nwid:0  Rx invalid crypt:0  Rx invalid frag:0
  #           Tx excessive retries:20  Invalid misc:36   Missed beacon:0


  echo $(iwconfig) | while read LINE; do
  if [[ "$LINE" =~ Tx-Power=off ]]; then
    echo .off
  elif [[ "$LINE" =~ ESSID:\".+\" ]]; then
    CWIFI=`echo $LINE | sed -r "s/.*ESSID:\"(.+)\".+/\1/g"`
    CWIFI=${CWIFI:0:5}
    echo ".${CWIFI^^}"
  elif [[ "$LINE" =~ Tx-Power=.+ ]]; then
    echo ""
  fi
done

}

function network(){
  wifiname=$(wifi)
  if [ ! -z "$wifiname" ]; then
       echo "$wifiname"
       exit
  fi
  enpname=$(enp)
  if [ ! -z "$enpname" ]; then
       echo "$enpname"
       exit
  fi
  echo ".(nmtui-connect)"
}
# This function parses /proc/net/dev file searching for a line containing $interface data.
# Within that line, the first and ninth numbers after ':' are respectively the received and transmited bytes.
function get_bytes {
  # Find active network interface
  interface=$(ip route get 8.8.8.8 2>/dev/null| awk '{print $5}')
  line=$(grep $interface /proc/net/dev | cut -d ':' -f 2 | awk '{print "received_bytes="$1, "transmitted_bytes="$9}')
  eval $line
  now=$(date +%s%N)
}

# Function which calculates the speed using actual and old byte number.
# Speed is shown in KByte per second when greater or equal than 1 KByte per second.
# This function should be called each second.

function get_velocity {
  value=$1
  old_value=$2
  now=$3

  timediff=$(($now - $old_time))
  velKB=$(echo "1000000000*($value-$old_value)/1024/$timediff" | bc)
  if test "$velKB" -gt 1024
  then
    echo $(echo "scale=2; $velKB/1024" | bc)M
  else
    echo ${velKB}K
  fi
}


print_volume() {
  volume="$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"
  if test "$volume" -gt 0
  then
    echo -e "\uE05D${volume}"
  else
    echo -e "Mute"
  fi
}

print_mem(){
  memfree=$(($(grep -m1 'MemAvailable:' /proc/meminfo | awk '{print $2}') / 1024))
  echo -e "$memfree"
}

print_temp(){
  test -f /sys/class/thermal/thermal_zone0/temp || return 0
  echo $(head -c 2 /sys/class/thermal/thermal_zone0/temp)C
}


get_time_until_charged() {

  # parses acpitool's battery info for the remaining charge of all batteries and sums them up
  sum_remaining_charge=$(acpitool -B | grep -E 'Remaining capacity' | awk '{print $4}' | grep -Eo "[0-9]+" | paste -sd+ | bc);

  # finds the rate at which the batteries being drained at
  present_rate=$(acpitool -B | grep -E 'Present rate' | awk '{print $4}' | grep -Eo "[0-9]+" | paste -sd+ | bc);

  # divides current charge by the rate at which it's falling, then converts it into seconds for `date`
  seconds=$(bc <<< "scale = 10; ($sum_remaining_charge / $present_rate) * 3600");

  # prettifies the seconds into h:mm:ss format
  pretty_time=$(date -u -d @${seconds} +%T);

  echo $pretty_time;
}

get_battery_combined_percent() {

  # ➜  Application acpi -b | awk '{print $0}'
  # Battery 0: Discharging, 98%, 06:12:36 remaining
  # ➜  Application acpi -b | awk '{print $1}'
  # Battery
  # ➜  Application acpi -b | awk '{print $2}'
  # 0:
  # ➜  Application acpi -b | awk '{print $3}'
  # Discharging,
  # ➜  Application acpi -b | awk '{print $4}'
  # 98%,

  # get charge of all batteries, combine them
  # total_charge=$(expr $(acpi -b | awk '{print $4}' | grep -Eo "[0-9]+" | paste -sd+ | bc));
  
  if $(acpi -b | grep --quiet Discharging) 
  then
    total_charge=$(acpi -b|  awk '{print $4}' | grep -Eo "[0-9]+")
  else
    total_charge=$(acpi -b|  awk '{print $5}' | grep -Eo "[0-9]+")
  fi

  # get amount of batteries in the device
  battery_number=$(acpi -b | wc -l);

  percent=$(expr $total_charge / $battery_number);

  echo $percent;
}

get_battery_charging_status() {

  if $(acpi -b | grep --quiet Discharging)
  then
    if [ $(get_battery_combined_percent) -lt 25 ]; then
      if [ $rval = 0 ]; then
        # zenity --warning --text "请充电" --width=300 --height=10 --timeout=1
        /home/zdz/.zdz/dwm/scripts/power
      fi
    fi

    if [ $(get_battery_combined_percent) -lt 10 ]; then
      if [ $rval = 0 ]; then
        # echo ".";
        echo "🪫.";
      else
        # echo ".";
        echo "🔋.";
      fi
      # echo "🪫.";
    elif [ $(get_battery_combined_percent) -lt 20 ]; then
      if [ $rval = 0 ]; then
        # echo ".";
        echo "🪫.";
      else
        # echo ".";
        echo "🔋.";
      fi
      # echo "🪫.";
    # elif [ $(get_battery_combined_percent) -lt 30 ]; then
    #   echo ".";
    # elif [ $(get_battery_combined_percent) -lt 50 ]; then
    #   echo ".";
    # elif [ $(get_battery_combined_percent) -lt 60 ]; then
    #   echo ".";
    # elif [ $(get_battery_combined_percent) -lt 90 ]; then
    #   echo ".";
    # elif [ $(get_battery_combined_percent) -lt 100 ]; then
    #   echo ".";
    else
      echo "🔋.";
      # echo ".";
    fi
  else # acpi can give Unknown or Charging if charging, https://unix.stackexchange.com/questions/203741/lenovo-t440s-battery-status-unknown-but-charging
    echo ".";
    # echo "";
      # echo ".";
      
  fi
}



print_bat(){
  #hash acpi || return 0
  #onl="$(grep "on-line" <(acpi -V))"
  #charge="$(awk '{ sum += $1 } END { print sum }' /sys/class/power_supply/BAT*/capacity)%"
  #if test -z "$onl"
  #then
  ## suspend when we close the lid
  ##systemctl --user stop inhibit-lid-sleep-on-battery.service
  #echo -e "${charge}"
  #else
  ## On mains! no need to suspend
  ##systemctl --user start inhibit-lid-sleep-on-battery.service
  #echo -e "${charge}"
  #fi
  #echo "$(get_battery_charging_status) $(get_battery_combined_percent)%, $(get_time_until_charged )";
  # echo "$(get_battery_charging_status) $(get_battery_combined_percent)%, $(get_time_until_charged )";
  echo "$(get_battery_charging_status)$(get_battery_combined_percent)%";
}
# ☀
print_date(){
  # date '+%a/%d/%H:%M'
  # date '+%u%d/%H:%M'
  # date '+%u/%m.%d/%H:%M'
  date '+%H:%M/%d%u'

}

show_record(){
  test -f /tmp/r2d2 || return
  rp=$(cat /tmp/r2d2 | awk '{print $2}')
  size=$(du -h $rp | awk '{print $1}')
  echo " $size $(basename $rp)"
}

if [ $rval = 0 ]; then

    # Get initial values
    get_bytes
    old_received_bytes=$received_bytes
    old_transmitted_bytes=$transmitted_bytes
    old_time=$now

    LOC=$(readlink -f "$0")
    DIR=$(dirname "$LOC")
    export IDENTIFIER="unicode"

    #. "$DIR/dwmbar-functions/dwm_transmission.sh"
    #. "$DIR/dwmbar-functions/dwm_cmus.sh"
    #. "$DIR/dwmbar-functions/dwm_resources.sh"
    #. "$DIR/dwmbar-functions/dwm_battery.sh"
    #. "$DIR/dwmbar-functions/dwm_mail.sh"
    #. "$DIR/dwmbar-functions/dwm_backlight.sh"
    . "$DIR/dwmbar-functions/dwm_alsa.sh"
    #. "$DIR/dwmbar-functions/dwm_pulse.sh"
    #. "$DIR/dwmbar-functions/dwm_weather.sh"
    #. "$DIR/dwmbar-functions/dwm_vpn.sh"
    #. "$DIR/dwmbar-functions/dwm_network.sh"
    #. "$DIR/dwmbar-functions/dwm_keyboard.sh"
    #. "$DIR/dwmbar-functions/dwm_ccurse.sh"
    #. "$DIR/dwmbar-functions/dwm_date.sh"

    get_bytes

    # Calculates speeds
    vel_recv=$(get_velocity $received_bytes $old_received_bytes $now)
    vel_trans=$(get_velocity $transmitted_bytes $old_transmitted_bytes $now)

    # STATUS_BAR_NEW="  ⬆$vel_recv ⬇$vel_trans  .$(print_mem)  $(dwm_alsa) $(getbrightness) $(network) $(print_date) [$(print_bat)]$(show_record) "
    STATUS_BAR_NEW="  ⬆$vel_recv ⬇$vel_trans  .$(print_mem)  $(dwm_alsa) $(getbrightness) $(network) $(print_date) [$(print_bat)]$(show_record) "
    # STATUS_BAR_NEW="   .$(print_mem)  $(dwm_alsa)  $(getbrightness)  $(print_date) [$(print_bat)]$(show_record) "
    # 💿⬛⚫💾🔘🔲🔳
    # STATUS_BAR_NEW="  $(print_date) ⬇️$vel_recv ⬆️$vel_trans 💿$(print_mem)M  $(dwm_alsa) $(getbrightness) $(network) [$(print_bat)]$(show_record) "
    echo "$STATUS_BAR_NEW" > $TEMP_STATUS
    # STATUS_BAR_NEW="echo -e \033[34;41mColor Text\033[0m"
    xsetroot -name "$STATUS_BAR_NEW"
    # xsetroot -name "xxxxx"
    # xsetroot  -bitmap grey_9_9.xbm  -name "aaa     $STATUS_BAR_NEW"
  else
    STATUS_BAR=$(sed -e "s/\[.*\]/[$(print_bat)]/g" "$TEMP_STATUS")
    xsetroot -name "$STATUS_BAR"
    # xsetroot -name "xxx"
fi

# Update old values to perform new calculations
old_received_bytes=$received_bytes
old_transmitted_bytes=$transmitted_bytes
old_time=$now

exit 0
