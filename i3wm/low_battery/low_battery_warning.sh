#!/bin/bash

THRESHOLD_HIBERNATE=5
THRESHOLD_NAG=7

BAT_INFO_DIR='/sys/class/power_supply/BAT0'
CHARGE_NOW=$(cat $BAT_INFO_DIR/charge_now)
CURRENT_NOW=$(cat $BAT_INFO_DIR/current_now)
STATUS=$(cat $BAT_INFO_DIR/status)

if [ $STATUS == "Charging" ]; then
  exit 0
fi

TIME_LEFT=$(echo "60*$CHARGE_NOW/$CURRENT_NOW" | bc)

echo $TIME_LEFT
echo $THRESHOLD_HIBERNATE
echo $THRESHOLD_NAG

if [ $TIME_LEFT -gt $THRESHOLD_NAG ]; then
  exit 0
fi

if [ $TIME_LEFT -gt $THRESHOLD_HIBERNATE ]; then
  '/usr/bin/i3-nagbar' -m "Battery level critical" -b "Hibernate" "pm-hibernate"
  exit 0
else
  pm-hibernate
fi
