#!/bin/sh

VARFR="$(free -mh | awk 'NR == 2 {print $4}')"
VARFRM="$(free -mm | awk 'NR == 2 {print $4}')"
echo "$VARFR"
echo "$VARFR"
if [ $VARFRM -lt 1000 ]; then
    echo "#e74c3c"
elif [ $VARFRM -lt 3000 ]; then
    echo "#f1c40f"
fi
