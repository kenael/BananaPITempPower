#!/bin/bash
# Author : Andreas Martin https://blog.ufff.de
# License : MIT
# Source  : https://github.com/kenael/BananaPITempPower

# Read CPU-Temperature with soctemp
# follow entry in sudoers is needed:
# Cmnd_Alias  SOCTEMP=/usr/sbin/soctemp
# telegraf  ALL=NOPASSWD: SOCTEMP
SOCTEMP=$(sudo /usr/sbin/soctemp |cut -d" " -f1)

# Board-Temperature and Power-Stats, pmutemp is a alternative
PMUTEMP=$(echo "scale=2; $(cat /sys/devices/platform/sunxi-i2c.0/i2c-0/0-0034/temp1_input) / 1000"|bc )
VOLT=$(echo "scale= 3; $(cat /sys/devices/platform/sunxi-i2c.0/i2c-0/0-0034/axp20-supplyer.28/power_supply/ac/voltage_now) / 1000000"|bc -l)
AMP=$( echo "scale=3; $(cat /sys/devices/platform/sunxi-i2c.0/i2c-0/0-0034/axp20-supplyer.28/power_supply/ac/current_now ) / 1000000 "| bc)
# Ouput in influx-data style for use with Telegraf
echo "hwstat,host=$(hostname) soctemp=$SOCTEMP,pmutemp=$PMUTEMP,volt=$VOLT,amp=$AMP"
