#!/bin/bash
while true; do
    MUSIC=$(`mpc current`)
   TIME=`date +"%F %I:%M %p"`
   VOLUME=$( amixer sget Master | grep -e 'Front Left:' | \
       sed 's/[^\[]*\[\([0-9]\{1,3\}%\).*\(on\|off\).*/\2 \1/' | sed 's/off/M/' | sed 's/on //' )
   xsetroot -name " $MUSIC | $VOLUME | $TIME "
   sleep 1s    # Update time every minute
done &
