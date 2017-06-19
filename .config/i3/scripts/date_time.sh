#!/bin/sh

VARDATE="$(date '+%d %b %Y')"
VARTIME="$(date '+%H:%M')"

echo "<span foreground='#b2b2b2'>"$VARDATE"</span> <span foreground='#f2f2f2'><b>"$VARTIME"</b></span>"
