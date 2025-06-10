#!/bin/bash

#Script to run SCRCPY

if pgrep -x "scrcpy" > /dev/null
then
    pkill -x scrcpy
    exit
fi

# Get list of connected devices
devices=$(adb devices | grep -v "List" | grep -v "^$" | cut -f1)

if [ -z "$devices" ]; then
    notify-send "No devices connected"
    exit 1
fi

# Use rofi to select device
selected_device=$(echo "$devices" | rofi -dmenu -config ~/.config/hypr/rofi/config.rasi -p "Select Device: ")

if [ -z "$selected_device" ]; then
    exit 1
fi

# Options for SCRCPY
options="Full screen
Windowed
Low quality
High quality
No audio
With audio"

# Use rofi to select SCRCPY mode
selected_option=$(echo -e "$options" | rofi -dmenu -config ~/.config/hypr/rofi/config.rasi -p "Select SCRCPY mode: ")

if [ -z "$selected_option" ]; then
    exit 1
fi

# Execute SCRCPY with selected options
case "$selected_option" in
    "Full screen")
        scrcpy -s "$selected_device" --fullscreen
        ;;
    "Windowed")
        scrcpy -s "$selected_device"
        ;;
    "Low quality")
        scrcpy -s "$selected_device" --max-size 800
        ;;
    "High quality")
        scrcpy -s "$selected_device" --max-size 1920
        ;;
    "No audio")
        scrcpy -s "$selected_device" --no-audio
        ;;
    "With audio")
        scrcpy -s "$selected_device" --audio
        ;;
esac
