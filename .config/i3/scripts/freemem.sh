#!/bin/sh

VARFR="$(free -mh | awk 'NR == 2 {print $4}')"
VARFRM="$(free -mm | awk 'NR == 2 {print $4}')"
VARCOLOR="#b2b2b2"
if [ $VARFRM -lt 1000 ]; then
    VARCOLOR="#e74c3c"
elif [ $VARFRM -lt 3000 ]; then
    VARCOLOR="#f1c40f"
fi

echo "<span foreground='"$VARCOLOR"'>"$VARFR"</span>"

