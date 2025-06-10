#!/bin/bash

# Function to check if a package is installed
check_package() {
    pacman -Qi "$1" &>/dev/null
    return $?
}

# Function to install package if not already installed
install_if_missing() {
    if ! check_package "$1"; then
        echo "Installing $1..."
        sudo pacman -S --needed "$1"
    else
        echo "$1 is already installed, skipping..."
    fi
}

# Move dotfiles to ~/.config/hypr
echo "Setting up configuration files..."
cp -r . ~/.config/hypr

# Edit hyprland.conf to include the source line
echo 'source = ~/.config/hypr/hyprland/hyprland.conf' > ~/.config/hypr/hyprland.conf

# List of required packages
packages=(
    "ttf-jetbrains-mono"
    "ttf-jetbrains-mono-nerd"
    "hyprpicker"
    "hyprpaper"
    "hyprpolkitagent"
    "nwg-look"
    "noto-fonts"
    "noto-fonts-emoji"
    "noto-fonts-extra"
    "swaync"
    "waybar"
    "hyprlock"
    "gnome-terminal"
    "firefox"
    "chromium"
    "cava"
    "scrcpy"
    "dolphin"
    "rofi-wayland"
    "cmus"
    "copyq"
    "flatpak"
    "fastfetch"
    "imagemagick"
)

# Install required packages if missing
echo "Checking and installing required packages..."
for package in "${packages[@]}"; do
    install_if_missing "$package"
done

# Check and install AUR packages if yay is available
if command -v yay &>/dev/null; then
    echo "Checking and installing AUR packages..."
    aur_packages=("hyprshot" "wlogout")
    for package in "${aur_packages[@]}"; do
        if ! check_package "$package"; then
            echo "Installing $package from AUR..."
            yay -S --needed "$package"
        else
            echo "$package is already installed, skipping..."
        fi
    done
else
    echo "yay not found. Please install it to get AUR packages."
fi

# Install Flatpak packages if flatpak is available
if command -v flatpak &>/dev/null; then
    echo "Installing Flatpak packages..."
    flatpak install --user it.mijorus.smile
else
    echo "flatpak not found. Please install it to get Flatpak packages."
fi

# Prompt to reboot
echo "Installation complete. Please reboot your system to apply changes." 