#!/bin/bash
while [ "$select" != "NO" -a "$select" != "YES" ]; do
    select=$(echo -e 'NO\nYES' | \
        dmenu -nb '#2f2f2f' -nf '#f3f4f5' -sb '#27ae60' -sf '#f3f4f5' -fn \
        'System San Francisco Display:bold:pixelsize=22' -i \
        -p "Are you sure you want to SHUTDOWN?")
    [ -z "$select" ] && exit 0
done
[ "$select" = "NO" ] && shutdown now
i3-msg exit
