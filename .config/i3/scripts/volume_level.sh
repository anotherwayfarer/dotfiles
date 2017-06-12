#!/bin/sh

VOLLVL="$(pactl list sinks | grep -A 12 'Sink #0' | grep -P '\tVolume' | gawk '{print $5}')"
echo $VOLLVL
echo $VOLLVL
