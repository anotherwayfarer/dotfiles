#!/bin/sh

VOLLVL="$(pactl list sinks | grep -A 12 'Sink #0' | grep -P '\tVolume' | gawk '{print $5}')"
VARCOLOR="#b2b2b2"

echo "<span foreground='"$VARCOLOR"'><b>"$VOLLVL"</b></span>"
