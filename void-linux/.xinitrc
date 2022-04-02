#!/bin/sh

xrdb /home/sheung/.Xresources
xrandr --output HDMI-1 --off
unclutter -idle 10 &
ppsspp-sdl
exec i3
