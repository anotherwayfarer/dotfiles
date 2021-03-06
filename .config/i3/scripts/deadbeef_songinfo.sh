#!/bin/sh

DBSONGNAME="$(deadbeef --nowplaying '%t')"
DBARTISTNAME="$(deadbeef --nowplaying '%a')"
OUTPUTLINE="$(echo $DBSONGNAME' - '$DBARTISTNAME)"

if ((${#OUTPUTLINE} > 35))
then
    SONGLEN=30-${#DBARTISTNAME}
    DBSONGNAME=${DBSONGNAME:0:SONGLEN}...
fi

if [ "$DBARTISTNAME" = "nothing" ]
then
    DBSONGINFO="<span foreground='#828282'>Nothing</span>"
else
    DBSONGINFO="<span foreground='#b8b8b8'>"$DBARTISTNAME"</span> <b>-</b> "
    DBSONGINFO=$DBSONGINFO"<span foreground='#d2d2d2'>"$DBSONGNAME"</span>"
fi

case $BLOCK_BUTTON in
    3) echo "$DBSONGINFO" | xclip ;;
    *) echo "$DBSONGINFO" ;;
esac
