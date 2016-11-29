#!/bin/sh

cat /proc/loadavg | gawk '{printf ("%d%",$1*100)}'
