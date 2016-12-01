#!/bin/sh

# get profile guid:
# > dconf list /org/gnome/terminal/legacy/profiles:/

# get parameters list:
# > dconf list /org/gnome/terminal/legacy/profiles:/:8b71cc14-f157-4ec2-9461-df15102e4a5b/i

# read param
# > dconf read /org/gnome/terminal/legacy/profiles:/:8b71cc14-f157-4ec2-9461-df15102e4a5b/foreground-color

dconf write /org/gnome/terminal/legacy/profiles:/:8b71cc14-f157-4ec2-9461-df15102e4a5b/foreground-color "'rgb(236,240,241)'"
dconf write /org/gnome/terminal/legacy/profiles:/:8b71cc14-f157-4ec2-9461-df15102e4a5b/visible-name "'Aim1'"
dconf write /org/gnome/terminal/legacy/profiles:/:8b71cc14-f157-4ec2-9461-df15102e4a5b/login-shell "false"
dconf write /org/gnome/terminal/legacy/profiles:/:8b71cc14-f157-4ec2-9461-df15102e4a5b/palette "['rgb(47,47,47)', 'rgb(231,76,60)', 'rgb(155,89,182)', 'rgb(22,160,133)', 'rgb(41,128,185)', 'rgb(155,89,182)', 'rgb(39,174,96)', 'rgb(238,232,213)', 'rgb(0,43,54)', 'rgb(230,126,34)', 'rgb(241,196,15)', 'rgb(189,195,199)', 'rgb(127,140,141)', 'rgb(155,89,182)', 'rgb(189,195,199)', 'rgb(253,246,227)']"
dconf write /org/gnome/terminal/legacy/profiles:/:8b71cc14-f157-4ec2-9461-df15102e4a5b/default-size-columns "100"
dconf write /org/gnome/terminal/legacy/profiles:/:8b71cc14-f157-4ec2-9461-df15102e4a5b/default-size-rows "40"
dconf write /org/gnome/terminal/legacy/profiles:/:8b71cc14-f157-4ec2-9461-df15102e4a5b/font "'DejaVu Sans Mono 12'"
dconf write /org/gnome/terminal/legacy/profiles:/:8b71cc14-f157-4ec2-9461-df15102e4a5b/use-system-font "false"
dconf write /org/gnome/terminal/legacy/profiles:/:8b71cc14-f157-4ec2-9461-df15102e4a5b/use-custom-command "false"
dconf write /org/gnome/terminal/legacy/profiles:/:8b71cc14-f157-4ec2-9461-df15102e4a5b/use-theme-colors "false"
dconf write /org/gnome/terminal/legacy/profiles:/:8b71cc14-f157-4ec2-9461-df15102e4a5b/use-theme-transparency "false"
dconf write /org/gnome/terminal/legacy/profiles:/:8b71cc14-f157-4ec2-9461-df15102e4a5b/bold-color-same-as-fg "true"
dconf write /org/gnome/terminal/legacy/profiles:/:8b71cc14-f157-4ec2-9461-df15102e4a5b/bold-color "'#9393a1a1a1a1'"
dconf write /org/gnome/terminal/legacy/profiles:/:8b71cc14-f157-4ec2-9461-df15102e4a5b/background-color "'rgb(47,47,47)'"
dconf write /org/gnome/terminal/legacy/profiles:/:8b71cc14-f157-4ec2-9461-df15102e4a5b/scrollbar-policy "'never'"
