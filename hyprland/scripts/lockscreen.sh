#!/bin/bash

#Script for lockscreen

sleep 2
powerprofilesctl set power-saver
hyprlock -c ~/.config/hypr/hyprland/hyprlock/hyprlock.conf
powerprofilesctl set performance
