#!/bin/sh

LOADAVG="$(cat /proc/loadavg | gawk '{print $1}')"
INTAVG="$(cat /proc/loadavg | gawk '{print $1*100}')"
echo $LOADAVG
echo $LOADAVG
if (($INTAVG < 100))
then
    echo "#2ecc71"
else
    echo "#e74c3c"
fi
