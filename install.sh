#!/bin/bash

# Move dotfiles to ~/.config/
cp -r . ~/.config/dotfiles

# Edit hyprland.conf to include the source line
echo 'source = ~/.config/dotfiles/hyprland/hyprland.conf' > ~/.config/hypr/hyprland.conf

# Install required packages
sudo pacman -S --needed ttf-jetbrains-mono ttf-jetbrains-mono-nerd hyprpicker hyprpaper hyprpolkitagent nwg-look noto-fonts noto-fonts-emoji noto-fonts-extra swaync waybar hyprlock gnome-terminal chromium cava scrcpy nemo rofi-wayland cmus copyq flatpak fastfetch imagemagick

# Install AUR packages
yay -S --needed gruvbox-dark-icons-gtk gruvbox-material-gtk-theme-git hyprshot wlogout zen-browser-bin

# Install Flatpak packages
flatpak install --user it.mijorus.smile

# Prompt to reboot
echo "Installation complete. Please reboot your system to apply changes." 