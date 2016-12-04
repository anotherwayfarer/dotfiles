#!/bin/sh

# this script overwrite one of your GT profile. You should have at least one profile

PRGUID="$(dconf list /org/gnome/terminal/legacy/profiles:/ | gawk 'NR==2')"

dconf write /org/gnome/terminal/legacy/profiles:/${PRGUID}foreground-color "'rgb(236,240,241)'"
dconf write /org/gnome/terminal/legacy/profiles:/${PRGUID}visible-name "'Aim1'"
dconf write /org/gnome/terminal/legacy/profiles:/${PRGUID}login-shell "false"
dconf write /org/gnome/terminal/legacy/profiles:/${PRGUID}palette "['rgb(47,47,47)', 'rgb(231,76,60)', 'rgb(39,174,96)', 'rgb(241,196,15)', 'rgb(41,128,185)', 'rgb(155,89,182)', 'rgb(39,174,96)', 'rgb(238,232,213)', 'rgb(0,43,54)', 'rgb(230,126,34)', 'rgb(241,196,15)', 'rgb(189,195,199)', 'rgb(127,140,141)', 'rgb(155,89,182)', 'rgb(189,195,199)', 'rgb(253,246,227)']"
dconf write /org/gnome/terminal/legacy/profiles:/${PRGUID}default-size-columns "100"
dconf write /org/gnome/terminal/legacy/profiles:/${PRGUID}default-size-rows "40"
dconf write /org/gnome/terminal/legacy/profiles:/${PRGUID}font "'DejaVu Sans Mono 12'"
dconf write /org/gnome/terminal/legacy/profiles:/${PRGUID}use-system-font "false"
dconf write /org/gnome/terminal/legacy/profiles:/${PRGUID}use-custom-command "false"
dconf write /org/gnome/terminal/legacy/profiles:/${PRGUID}use-theme-colors "false"
dconf write /org/gnome/terminal/legacy/profiles:/${PRGUID}use-theme-transparency "false"
dconf write /org/gnome/terminal/legacy/profiles:/${PRGUID}bold-color-same-as-fg "true"
dconf write /org/gnome/terminal/legacy/profiles:/${PRGUID}bold-color "'#9393a1a1a1a1'"
dconf write /org/gnome/terminal/legacy/profiles:/${PRGUID}background-color "'rgb(47,47,47)'"
dconf write /org/gnome/terminal/legacy/profiles:/${PRGUID}scrollbar-policy "'never'"
