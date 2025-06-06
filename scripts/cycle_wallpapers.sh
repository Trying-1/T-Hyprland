#!/bin/bash

# Configuration
WALLPAPER_DIR="$HOME/.config/hypr/wallpapers"
CURRENT_WALLPAPER="$WALLPAPER_DIR/current_wallpaper.png"

# Get list of wallpapers
WALLPAPERS=("$WALLPAPER_DIR/wallpaper1.png" 
             "$WALLPAPER_DIR/wallpaper2.png" 
             "$WALLPAPER_DIR/wallpaper3.png")

# Find current wallpaper index
CURRENT_INDEX=0
for i in "${!WALLPAPERS[@]}"; do
    if [ -L "$CURRENT_WALLPAPER" ] && [ "$(readlink -f "$CURRENT_WALLPAPER")" == "${WALLPAPERS[$i]}" ]; then
        CURRENT_INDEX=$i
        break
    fi
    # Also check if the file exists directly (not a symlink)
    if [ -f "$CURRENT_WALLPAPER" ] && [ "$(readlink -f "$CURRENT_WALLPAPER")" == "$(readlink -f "${WALLPAPERS[$i]}")" ]; then
        CURRENT_INDEX=$i
        break
    fi
done

# Calculate next wallpaper index
NEXT_INDEX=$(( (CURRENT_INDEX + 1) % ${#WALLPAPERS[@]} ))
NEXT_WALLPAPER="${WALLPAPERS[$NEXT_INDEX]}"

# Set the new wallpaper
hyprctl hyprpaper unload all
hyprctl hyprpaper preload "$NEXT_WALLPAPER"
hyprctl hyprpaper wallpaper "eDP-1,$NEXT_WALLPAPER"

# Update symlink
ln -sf "$NEXT_WALLPAPER" "$CURRENT_WALLPAPER"

echo "Wallpaper changed to: $(basename "$NEXT_WALLPAPER")"
