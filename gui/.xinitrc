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

xrandr --newmode "1920x1080R_75.00" 167.85 1920 1928 1960 2000 1080 1105 1113 1119 -hsync -vsync
xrandr --addmode HDMI-A-0 "1920x1080R_75.00"
xrandr --output HDMI-A-0 --mode "1920x1080R_75.00"
xsetwacom set "XP-PEN STAR G640 Pen stylus" area 0 10000 16000 20000
exec bspwm 

