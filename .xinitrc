#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

sh ~/.fehbg &
xrandr --auto 
xrandr --output DVI-D-0 --primary --pos 0x0 --mode 1920x1080 -r 144.00 --output HDMI-0 --pos 1920x0 --output DP-5 --pos -1920x0 --output DP-1 --pos 0x-1080 &
picom -b -c --config ~/.config/picom/picom.conf &
caffeine &
udiskie -t &
exec i3

