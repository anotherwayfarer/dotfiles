#!/bin/sh

VARSP="$(df -h "$1" | gawk 'NR == 2 {print $4}')"
VARPERC="$(df -h "$1" | gawk 'NR == 2 {print $5}' | cut -f1 -d'%')"
echo "$VARSP"
echo "$VARSP"
if [ $VARPERC -ge 70 ]; then
    echo "#e74c3c"
elif [ $VARPERC -ge 40 ]; then
    echo "#f1c40f"
fi

