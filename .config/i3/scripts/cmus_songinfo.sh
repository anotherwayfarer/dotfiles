#!/bin/sh

DBSONGNAME="$(cmus-remote -Q | egrep 'tag title' | sed -r 's/^.{10}//')"
DBARTISTNAME="$(cmus-remote -Q | egrep 'tag artist' | sed -r 's/^.{11}//')"
OUTPUTLINE="$(echo $DBSONGNAME' - '$DBARTISTNAME)"

if ((${#OUTPUTLINE} > 50))
then
    SONGLEN=45-${#DBARTISTNAME}
    DBSONGNAME=${DBSONGNAME:0:SONGLEN}...
fi

if [ "$DBARTISTNAME" = "" ]
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
