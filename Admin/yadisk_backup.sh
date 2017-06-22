#!/bin/bash -

source yadiskconf.sh

mkdir -p /mnt/yadisk
mount -t davfs -o user,uid=$USER,username=$YAUSER https://webdav.yandex.ru:443 /mnt/yadisk
rsync -au ~/Admin/bkp /mnt/yadisk/bkp/
umount /mnt/yadisk
