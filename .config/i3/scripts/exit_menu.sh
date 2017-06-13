#!/bin/bash

while [ "$select" != "NOTHING" -a "$select" != "LOGOUT" \
        -a "$select" != "SHUTDOWN" -a "$select" != "REBOOT" ]; do
    select=$(echo -e 'NOTHING\nLOGOUT\nSHUTDOWN\nREBOOT' | \
        dmenu -nb '#2f2f2f' -nf '#f3f4f5' -sb '#27ae60' -sf '#f3f4f5' -fn \
        'System San Francisco Display:bold:pixelsize=22' -i \
        -p "What do you want to do?")
    [ -z "$select" ] && exit 0
done

if [ "$select" = "NOTHING" ]; then
    exit 0;
else
    killall -HUP cmus;
    killall -HUP chromium;
    killall -HUP Telegram;
    killall -HUP vim;
fi

[ "$select" = "LOGOUT" ] && i3-msg exit;
[ "$select" = "SHUTDOWN" ] && shutdown now;
[ "$select" = "REBOOT" ] && shutdown -r now;
