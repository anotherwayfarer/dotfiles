#!/bin/sh

DBSONGNAME="$(cmus-remote -Q | egrep 'tag title' | sed -r 's/^.{10}//')"
DBARTISTNAME="$(cmus-remote -Q | egrep 'tag artist' | sed -r 's/^.{11}//')"
OUTPUTLINE="$(echo $DBARTISTNAME' - '$DBSONGNAME)"

if ((${#OUTPUTLINE} > 50))
then
    ARTISTLEN=${#DBARTISTNAME}
    if (($ARTISTLEN > 25))
    then
        SONGLEN=27
        DBARTISTNAME=${DBARTISTNAME:0:20}...
    else
        SONGLEN=45-${#DBARTISTNAME}
    fi
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
    3) echo "$OUTPUTLINE" | xclip ;;
    *) echo "$DBSONGINFO" ;;
esac
