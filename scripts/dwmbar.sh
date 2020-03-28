# Statusbar loop
while true; do
   xsetroot -name "$( date +"%F %I:%M %P" )"
   sleep 1m    # Update time every minute
done &
