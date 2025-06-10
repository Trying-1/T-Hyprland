#!/usr/bin/bash

#Restart Waybar and swaync

killall waybar
killall swaync
waybar -c ~/.config/hypr/waybar/config -s ~/.config/hypr/waybar/style.css &
swaync -s ~/.config/hypr/swaync/style.css -c ~/.config/hypr/swaync/config.json &
notify-send --app-name=HOME -i ~/.config/hypr/fastfetch/moon.png Hello
