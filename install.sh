#!/usr/bin/env bash

# Import functions
scrDir="$(dirname "$(realpath \"$0\")")"
if ! source "${scrDir}/global_fn.sh"; then
    echo "Error: unable to source global_fn.sh"
    exit 1
fi

# Check if running as root
if [[ $EUID -eq 0 ]]; then
    echo "This script should not be run as root"
    exit 1
fi

# Create required directories
mkdir -p "${confDir}/hypr"
mkdir -p "${confDir}/waybar"
mkdir -p "${confDir}/wofi"
mkdir -p "${confDir}/wallpapers"
mkdir -p "${confDir}/dunst"
mkdir -p "${confDir}/cliphist"
mkdir -p "${confDir}/cava"
mkdir -p "${confDir}/kitty"
mkdir -p "${HOME}/.cache/hyprpaper"

# Backup existing configurations
backup_dir="${confDir}/hypr_backup_$(date +%Y%m%d_%H%M%S)"
if [ -d "${confDir}/hypr" ]; then
    echo "Backing up existing configuration..."
    mkdir -p "$backup_dir" || {
        echo "Error: Failed to create backup directory"
        exit 1
    }
    cp -r "${confDir}/hypr"/* "$backup_dir/" || {
        echo "Error: Failed to backup configuration"
        exit 1
    }
    echo "Backup completed: $backup_dir"
fi

# Install packages
if ! pkg_installed "pacman"; then
    echo "Error: pacman is not installed"
    exit 1
fi

# Install AUR helper if needed
if ! pkg_installed "yay" && ! pkg_installed "paru"; then
    echo "Installing AUR helper..."
    sudo pacman -S --noconfirm git base-devel
    
    # Try yay first
    if ! pkg_installed "yay"; then
        git clone https://aur.archlinux.org/yay.git /tmp/yay
        if [ $? -ne 0 ]; then
            echo "Error: Failed to clone yay repository"
            exit 1
        fi
        cd /tmp/yay
        makepkg -si --noconfirm
        if [ $? -ne 0 ]; then
            echo "Error: Failed to install yay"
            exit 1
        fi
        cd -
        rm -rf /tmp/yay
    fi
fi

# Install packages from pkg_minimal.lst
while read -r pkg; do
    if ! pkg_installed "$pkg"; then
        echo "Installing $pkg..."
        if pkg_available "$pkg"; then
            sudo pacman -S --noconfirm "$pkg"
        elif aur_available "$pkg"; then
            yay -S --noconfirm "$pkg"
        else
            echo "Warning: Package $pkg not found in repositories or AUR"
            continue
        fi
    fi
done < "${scrDir}/pkg_minimal.lst"

# Copy configuration files
echo "Copying configuration files..."
for dir in audio display shell terminal wallpapers window; do
    if [ -d "${scrDir}/configs/${dir}" ]; then
        echo "Copying ${dir} configuration..."
        mkdir -p "${confDir}/${dir}" || {
            echo "Error: Failed to create ${dir} directory"
            exit 1
        }
        cp -r "${scrDir}/configs/${dir}"/* "${confDir}/${dir}/" || {
            echo "Error: Failed to copy ${dir} configuration"
            exit 1
        }
    fi
done

# Set proper permissions
chmod -R 700 "${confDir}" "${HOME}/.cache"

# Enable and start services
echo "Enabling and starting services..."

# Enable pipewire services
if ! systemctl --user is-enabled pipewire &>/dev/null; then
    systemctl --user enable --now pipewire
fi
if ! systemctl --user is-enabled pipewire-pulse &>/dev/null; then
    systemctl --user enable --now pipewire-pulse
fi

# Enable networkmanager
if ! systemctl --user is-enabled networkmanager &>/dev/null; then
    systemctl --user enable --now networkmanager
fi

# Enable dunst
if ! systemctl --user is-enabled dunst &>/dev/null; then
    systemctl --user enable --now dunst
fi

# Enable cliphist
if ! systemctl --user is-enabled cliphist &>/dev/null; then
    systemctl --user enable --now cliphist
fi

# Create user directories
xdg-user-dirs-update

# Create wallpaper directory
mkdir -p "${confDir}/wallpapers"

# Create cache directories
mkdir -p "${HOME}/.cache/hyprpaper"

# Set up shell configuration
if [ -f "${HOME}/.zshrc" ]; then
    cp "${scrDir}/configs/shell/prompt.conf" "${HOME}/.zshrc"
fi

# Create all necessary directories
mkdir -p "${confDir}/hypr"
mkdir -p "${confDir}/hypr/wallpapers"
mkdir -p "${confDir}/hypr/scripts"
mkdir -p "${HOME}/.cache/hyprpaper"
mkdir -p "${HOME}/Pictures/screenshots"

# Set up wallpaper and scripts
if [ -d "${scrDir}/wallpapers" ]; then
    # Copy wallpapers
    cp -r "${scrDir}/wallpapers/"* "${confDir}/hypr/wallpapers/"
    
    # Install wallpaper scripts
    chmod +x "${scrDir}/scripts/wallpaper.sh"
    chmod +x "${scrDir}/scripts/cycle_wallpapers.sh"
    cp "${scrDir}/scripts/wallpaper.sh" "${confDir}/hypr/scripts/"
    cp "${scrDir}/scripts/cycle_wallpapers.sh" "${confDir}/hypr/scripts/"
    
    # Set initial wallpaper
    "${confDir}/hypr/scripts/wallpaper.sh"
fi

# Reload hyprland
echo "Reloading hyprland..."
hyprctl reload

echo "Installation complete!"
echo "Please log out and log back in to apply all changes."

# Success message
echo "Setup complete! Please log out and back in for all changes to take effect."
