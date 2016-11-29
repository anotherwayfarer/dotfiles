#!/bin/sh
    
df -h "$1" | gawk 'NR == 2 {print $4}'
