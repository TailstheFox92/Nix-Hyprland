#!/usr/bin/env bash

# Initializing wallpaper daemon
swww init &
# Setting Wallpaper
swww img ~/Pictures/Wallpapers/RetroRuins.jpg &

# Network Manager
nm-applet --indicator &

# The bar
waybar &

# Notification manager
mako
