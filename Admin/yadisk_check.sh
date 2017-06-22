#!/bin/bash -

# export YAUSER, GPGPASS
source yadisk_conf.sh

# tar cvpzf $HOME/Admin/bkp/documents_$(date +%Y_%m_%d_%H_%M).tgz --exclude=/proc --exclude=/lost+found --exclude=/backup.tgz --exclude=/mnt --exclude=/sys $HOME/Documents

DOCFILE=$(ls $HOME/Admin/bkp/*.tgz.gpg)
DOCFILE=${DOCFILE:0:${#DOCFILE}-4}

# tar cvpzf $DOCFILE $HOME/Documents
gpg --batch --yes --passphrase $GPGPASS --cipher-algo AES256 -o $DOCFILE -d $DOCFILE.gpg
tar xf $DOCFILE -C $HOME/Admin/bkp/

# mkdir -p /mnt/yadisk
# mount -t davfs -o user,uid=$USER,username=$YAUSER https://webdav.yandex.ru:443 /mnt/yadisk
# rsync -auP ~/Admin/bkp /mnt/yadisk/bkp/
# umount /mnt/yadisk
