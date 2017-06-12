#!/bin/sh

DBSONGNAME="$(deadbeef --nowplaying '%a')"
DBARTISTNAME="$(deadbeef --nowplaying '%t')"
OUTPUTLINE="$(echo $DBSONGNAME ' - ' $DBARTISTNAME)"

if ((${#OUTPUTLINE} > 30))
then
    SONGLEN=27-${#DBARTISTNAME}
    DBSONGNAME=${DBSONGNAME:0:SONGLEN}
fi

DBSONGINFO="<span foreground='#f39c12'>"$DBARTISTNAME"</span> - "
DBSONGINFO=$DBSONGINFO"<span foreground='#f1c40f'>"$DBSONGNAME"</span>"

case $BLOCK_BUTTON in
    3) echo "$DBSONGINFO" | xclip ;;
    *) echo "$DBSONGINFO" ;;
esac
