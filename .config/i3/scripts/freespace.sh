#!/bin/sh

VARSP="$(df -h "$1" | gawk 'NR == 2 {print $4}')"
VARPERC="$(df -h "$1" | gawk 'NR == 2 {print $5}' | cut -f1 -d'%')"
VARCOLOR="#b2b2b2"
if (( $VARPERC > 75 )); then
    VARCOLOR="#e74c3c"
elif (( $VARPERC > 50 )); then
    VARCOLOR="#f1c40f"
fi

echo "<span foreground='"$VARCOLOR"'>"$VARSP"</span>"
