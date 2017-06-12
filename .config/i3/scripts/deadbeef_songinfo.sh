#!/bin/sh

DBSONGINFO="$(deadbeef --nowplaying '%a - %t')"
if ((${#DBSONGINFO} > 30))
then
    echo ${DBSONGINFO:0:30}...
    echo ${DBSONGINFO:0:30}...
else
    echo $DBSONGINFO
    echo $DBSONGINFO
fi
