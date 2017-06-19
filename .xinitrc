[[ -f ~/.Xresources ]] && xrdb -merge $HOME/.Xresources

# disable bell
xset -b
xset dpms 600

export TERMINAL=/usr/bin/urxvt
export EDITOR=/usr/local/bin/vim
export LC_ALL=en_US.UTF-8

# exec feh --bg-scale /home/aim/mywall.png &
exec i3 -l
# exec i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1

# setup keyboard layouts
setxkbmap -layout "us,ru" -option "grp:caps_toggle,grp_led:scroll,ctrl:nocaps"

teamviewer --daemon start
