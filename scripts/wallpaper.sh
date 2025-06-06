#!/bin/bash

# Wallpaper directory
WALLPAPER_DIR="$(dirname "$0")/../wallpapers"
CONFIG_DIR="$HOME/.config/hypr/wallpapers"

# Create config directory if it doesn't exist
mkdir -p "$CONFIG_DIR"

# Copy wallpapers to config directory
cp -n "$WALLPAPER_DIR/wallpaper1.png" "$CONFIG_DIR/"
cp -n "$WALLPAPER_DIR/wallpaper2.png" "$CONFIG_DIR/"
cp -n "$WALLPAPER_DIR/wallpaper3.png" "$CONFIG_DIR/"

# Set default wallpaper (wallpaper1.png as default)
DEFAULT_WALLPAPER="$CONFIG_DIR/wallpaper1.png"

# Set wallpaper using hyprpaper
hyprctl hyprpaper unload all
hyprctl hyprpaper preload "$DEFAULT_WALLPAPER"
hyprctl hyprpaper wallpaper "eDP-1,$DEFAULT_WALLPAPER"

# Create a symlink to the current wallpaper
ln -sf "$DEFAULT_WALLPAPER" "$CONFIG_DIR/current_wallpaper.png"

echo "Wallpaper set to: $(basename "$DEFAULT_WALLPAPER")"
