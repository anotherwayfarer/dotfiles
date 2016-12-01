#!/bin/sh

cat /proc/loadavg | gawk '{print $1}'
