#!/bin/sh

VARKL="$(~/DevTools/xkblayout-state print %s | tr [a-z] [A-Z])"
echo $VARKL
echo $VARKL
case "$VARKL" in
    "US" ) echo "#2ecc71";;
    "RU" ) echo "#3498db";;
esac

