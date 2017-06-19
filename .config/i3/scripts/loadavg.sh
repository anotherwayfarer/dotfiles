#!/bin/sh

LOADAVG="$(cat /proc/loadavg | gawk '{print $1}')"
INTAVG="$(cat /proc/loadavg | gawk '{print $1*100}')"
VARCOLOR="#b2b2b2"
if (($INTAVG > 350))
then
    VARCOLOR="#e74c3c"
elif (($INTAVG > 200))
then
    VARCOLOR="#f1c40f"
fi

echo "<span foreground='"$VARCOLOR"'>"$LOADAVG"</span>"

