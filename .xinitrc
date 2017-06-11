# exec i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1
exec i3
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
setxkbmap -layout "us,ru" -option "grp:caps_toggle,grp_led:scroll,ctrl:nocaps"
