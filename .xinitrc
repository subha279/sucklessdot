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

picom -b &
~/sucklessdot/Scripts/Bar/bar.sh &
nm-applet &
blueman-applet &
~/sucklessdot/Scripts/wallpaper.sh &

xrandr --output eDP-1 --auto --left-of HDMI-1
xrandr --output HDMI-1 --mode 1920x1080 --scale 1x1 --pos 0x0 --rate 165 --primary

exec dwm
