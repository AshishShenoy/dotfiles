#!/usr/bin/env bash

# Setup external monitor
xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --rate 60 --output HDMI-1-0 --mode 2560x1440 --pos 1920x0 --rotate normal --rate 144

# Session manager
lxsession &

# Remap caps lock to escape.
setxkbmap -option caps:escape &

# Reduce keyboard repeat rate delay
xset r rate 200 30

 # Restore background.
nitrogen --restore &

# Network Manager applet
nm-applet &

# Compositor
picom &

# Night light
redshift -l 12.87:74.84 &

# File sync
nextcloud &

