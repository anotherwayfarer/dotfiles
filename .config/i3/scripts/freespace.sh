#!/bin/sh
    
df -h "$1" | awk 'FNR == 2 {print $4}'
