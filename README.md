# **T-Hyprland**

A modern and minimal Hyprland configuration with a focus on productivity and aesthetics. Features a clean, neutral color scheme with a focus on readability and usability.

## Features

- 🎨 Clean and modern desktop environment with a neutral color scheme
- ⌨️ Efficient keyboard-driven workflow
- 🎯 Customizable window management
- 🎵 Built-in media controls
- 🔍 Powerful application launcher
- 🎮 Gaming-friendly configuration
- 📁 Advanced file management with Dolphin

## Screenshots
Please manually place your screenshots in the `screenshots` directory and reference them as needed in your documentation.

## Prerequisites

- Arch Linux or an Arch-based distribution
- A Wayland-compatible graphics driver
- Basic knowledge of Linux terminal commands

## Packages

### Official Repo
Required packages:
```
ttf-jetbrains-mono ttf-jetbrains-mono-nerd hyprpicker hyprpaper hyprpolkitagent nwg-look noto-fonts noto-fonts-emoji noto-fonts-extra swaync waybar hyprlock gnome-terminal firefox chromium cava scrcpy dolphin rofi-wayland cmus copyq flatpak fastfetch imagemagick
```

### AUR
Additional packages (requires yay):
```
hyprshot wlogout
```

## Installation

1. Clone this repo to your `.config/hypr` directory:
```bash
git clone https://github.com/Trying-1/T-Hyprland ~/.config/hypr/
```

2. Run the installation script:
```bash
cd ~/.config/hypr
chmod +x install.sh
./install.sh
```

The installation script will:
- Check for existing packages and only install missing ones
- Set up configuration files
- Install required packages from official repositories
- Install AUR packages if yay is available
- Install Flatpak packages if flatpak is available

3. Reboot your system to apply changes.

## Configuration

- **Window Manager**: Hyprland
- **Terminal**: Kitty with a clean, neutral theme
- **Browser**: Firefox (default), Chromium
- **File Manager**: Dolphin (KDE's powerful file manager with split view, tabs, and advanced features)
- **Application Launcher**: Rofi
- **Notification Center**: SwayNC with a modern, minimal design
- **Status Bar**: Waybar with a neutral color scheme
- **Lock Screen**: Hyprlock

## Troubleshooting

If you encounter any issues during installation:
1. Make sure you have all prerequisites installed
2. Check if yay is installed for AUR packages
3. Ensure flatpak is installed for Flatpak packages
4. Check the terminal output for specific error messages

## Contributing

Feel free to submit issues and enhancement requests!
