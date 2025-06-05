# Minimal Hyprland Setup

A clean and minimal configuration for Hyprland window manager with essential features and configurations.

## Important Notes

⚠️ **Disclaimer:**
- This is a minimal setup and may not include all features you're used to from other desktop environments.
- Ensure you have a backup of your current configuration before installing.
- This setup assumes you're using Arch Linux or a derivative.
- The installation script will modify system files and install packages.
- Use at your own risk.

## Features

- 🖥️ Clean and minimal Hyprland setup
- 🎨 Consistent dark theme across all applications
- 🖼️ Wallpaper management with cycling support
- 🎵 Audio controls with visual feedback
- 📋 Clipboard manager integration
- 📸 Screenshot utilities
- 🔒 Screen locking and session management
- ⚡ Optimized for performance

## Prerequisites

- Arch Linux (or an Arch-based distribution)
- A working Wayland session
- Git
- Base development tools

## Installation

### 1. System Preparation

Update your system and install required dependencies:

```bash
# Update system
sudo pacman -Syu

# Install base development tools
sudo pacman -S git base-devel

# Enable system services
sudo systemctl enable --now pipewire pipewire-pulse
sudo systemctl enable --now NetworkManager

# Create required directories
mkdir -p ~/.config/hypr
mkdir -p ~/.cache/hyprpaper
mkdir -p ~/Pictures/screenshots
```

### 2. Install Configuration

Download the repository and run the installation script:

```bash
# Download the repository
mkdir -p ~/.config/hypr
cd ~/.config/hypr
wget https://github.com/Trying-1/T-Hyprland/archive/refs/heads/master.zip
unzip master.zip
mv T-Hyprland-master/* .
rm -rf T-Hyprland-master master.zip
```

```bash
# Make scripts executable
chmod +x install.sh

# Run installation script
./install.sh
```

The installation script will:
- Install all required packages
- Set up configuration files
- Configure system services
- Set up the default wallpaper

### 3. Post-Installation

After installation, log out and select Hyprland from your display manager. If you're using a TTY, you can start Hyprland with:

```bash
exec Hyprland
```

## Keybindings

| Keybinding | Action |
|------------|--------|
| `SUPER + W` | Cycle wallpapers |
| `SUPER + Enter` | Open terminal |
| `SUPER + D` | Open application launcher |
| `SUPER + Q` | Close window |
| `SUPER + Shift + S` | Take a screenshot |
| `SUPER + L` | Lock screen |
| `SUPER + Shift + E` | Logout menu |

For a complete list of keybindings, see [keybindings.conf](keybindings.conf).

## Features
- Status bar with modules (waybar)
- Notification system (dunst)
- Clipboard management (cliphist)
- Wallpaper management (hyprpaper)
- Custom keybindings and workspace rules
- Organized configuration structure
- Development tools and utilities

## Prerequisites

Before installing, ensure you have:

1. A fresh Arch Linux installation
2. Root access (sudo)
3. Basic Linux knowledge
4. A working internet connection
5. At least 5GB of free disk space

## Installation Guide

### 1. System Preparation

```bash
# Update system
sudo pacman -Syu

# Enable system services
sudo systemctl enable pipewire pipewire-pulse
sudo systemctl enable NetworkManager

# Create required directories
mkdir -p ~/.config/hypr
mkdir -p ~/.cache/hyprpaper
mkdir -p ~/Pictures/screenshots
```

### 2. Install Dependencies

```bash
# Install required packages
sudo pacman -S git base-devel

# Clone the repository
mkdir -p ~/.config/hypr
cd ~/.config/hypr

git clone https://github.com/yourusername/minimal-hyprland.git .

# Run installation script
./install.sh
```

### 3. Post-Installation

After installation:

1. Log out of your current session
2. Select Hyprland from your display manager
3. Log back in
4. Verify all services are running:
   ```bash
   systemctl --user status pipewire
   systemctl --user status NetworkManager
   systemctl --user status dunst
   systemctl --user status cliphist
   ```

### 4. Usage

#### Keybindings
- `SUPER + Q`: Close window
- `SUPER + W`: Toggle floating window
- `SUPER + E`: Open file manager
- `SUPER + R`: Open terminal
- `SUPER + D`: Application launcher
- `SUPER + F`: Toggle fullscreen
- `SUPER + L`: Lock screen
- `SUPER + SHIFT + E`: Logout menu

#### Audio Controls
- `XF86AudioLowerVolume`: Decrease volume
- `XF86AudioRaiseVolume`: Increase volume
- `XF86AudioMute`: Toggle mute
- `SUPER + B`: Toggle audio visualization

#### Screen Controls
- `XF86MonBrightnessDown`: Decrease brightness
- `XF86MonBrightnessUp`: Increase brightness

#### Window Management
- `SUPER + H/J/K/L`: Move window
- `SUPER + SHIFT + H/J/K/L`: Resize window
- `SUPER + F11/F12`: Adjust window opacity
- `SUPER + T`: Toggle always on top
- `SUPER + G`: Toggle window decorations
- `SUPER + N`: Toggle window border
- `SUPER + M`: Toggle window shadow

### 5. Troubleshooting

#### A. Installation Issues

1. **Missing Dependencies**
   ```bash
   # Check missing packages
   pacman -Ql hyprland pipewire networkmanager dunst cliphist
   
   # Install missing packages
   sudo pacman -S hyprland pipewire networkmanager dunst cliphist
   ```

2. **Permission Errors**
   ```bash
   # Check directory permissions
   ls -la ~/.config/hypr
   
   # Fix permissions
   chmod -R 700 ~/.config/hypr
   ```

3. **Configuration Conflicts**
   ```bash
   # Backup existing configs
   mv ~/.config/hypr ~/.config/hypr.backup
   
   # Reinstall configuration
   ./install.sh
   ```

#### B. System Services

1. **Pipewire Issues**
   ```bash
   # Check status
   systemctl --user status pipewire
   
   # Restart service
   systemctl --user restart pipewire
   ```

2. **NetworkManager Issues**
   ```bash
   # Check status
   systemctl --user status NetworkManager
   
   # Restart service
   systemctl --user restart NetworkManager
   
   # Check connections
   nmcli device status
   ```

3. **Dunst Issues**
   ```bash
   # Check status
   systemctl --user status dunst
   
   # Restart service
   systemctl --user restart dunst
   
   # Test notifications
   notify-send "Test" "This is a test notification"
   ```

4. **Cliphist Issues**
   ```bash
   # Check status
   systemctl --user status cliphist
   
   # Restart service
   systemctl --user restart cliphist
   
   # Test clipboard
   echo "test" | cliphist store
   cliphist show
   ```

#### C. Audio Issues

1. **No Sound**
   ```bash
   # Check audio devices
   pamixer --list-sinks
   
   # Set default sink
   pamixer --set-default-sink <sink-name>
   
   # Test audio
   paplay /usr/share/sounds/freedesktop/stereo/complete.oga
   ```

2. **Cava Issues**
   ```bash
   # Check audio sources
   cava -l
   
   # Start cava
   cava
   
   # Kill cava
   pkill cava
   ```

#### D. Display Issues

1. **Brightness Controls**
   ```bash
   # Check available screens
   brightnessctl -l
   
   # Test brightness
   brightnessctl set 50%
   ```

2. **Multiple Monitors**
   ```bash
   # Check connected displays
   hyprctl monitors
   
   # Configure monitors
   hyprctl keyword monitors "<monitor-name> position <x> <y>"
   ```

3. **Screen Tearing**
   ```bash
   # Check compositor settings
   hyprctl getoption general:vfr
   
   # Enable VFR
   hyprctl keyword general:vfr true
   ```

#### E. Window Management

1. **Keybindings Not Working**
   ```bash
   # Check keybindings
   hyprctl getbinds
   
   # Reload config
   hyprctl reload
   ```

2. **Floating Windows**
   ```bash
   # Toggle floating
   hyprctl dispatch togglefloating
   
   # Set size
   hyprctl dispatch resizeactive exact 800 600
   ```

3. **Workspace Issues**
   ```bash
   # List workspaces
   hyprctl workspaces
   
   # Move window
   hyprctl dispatch movetoworkspacesilent 2
   ```

#### F. Wayland Issues

1. **XWayland Apps**
   ```bash
   # Check XWayland status
   systemctl --user status xwayland
   
   # Start XWayland app
   xwayland &
   ```

2. **Clipboard Integration**
   ```bash
   # Check Wayland clipboard
   wl-paste
   
   # Copy to Wayland clipboard
   echo "test" | wl-copy
   ```

3. **Screen Recording**
   ```bash
   # Install recorder
   sudo pacman -S wf-recorder
   
   # Record screen
   wf-recorder --output ~/screencast.mp4
   ```

#### G. Configuration Issues

1. **Invalid Config**
   ```bash
   # Check config syntax
   hyprctl getoption general:layout
   
   # Backup config
   cp ~/.config/hypr/hyprland.conf ~/.config/hypr/hyprland.conf.backup
   ```

2. **Missing Files**
   ```bash
   # Check config files
   ls -la ~/.config/hypr/*.conf
   
   # Copy default configs
   cp /usr/share/hyprland/*.conf ~/.config/hypr/
   ```

3. **Permissions**
   ```bash
   # Fix permissions
   chmod 644 ~/.config/hypr/*.conf
   
   # Change ownership
   chown $USER:$USER ~/.config/hypr/*.conf
   ```

#### H. Common Fixes

1. **Complete Reset**
   ```bash
   # Stop services
   systemctl --user stop pipewire NetworkManager dunst cliphist
   
   # Remove config
   rm -rf ~/.config/hypr
   
   # Reinstall
   ./install.sh
   ```

2. **Update System**
   ```bash
   # Update system
   sudo pacman -Syu
   
   # Reinstall packages
   sudo pacman -S --overwrite "*" hyprland pipewire networkmanager dunst cliphist
   ```

3. **Log Files**
   ```bash
   # Check hyprland logs
   journalctl --user -u hyprland
   
   # Check pipewire logs
   journalctl --user -u pipewire
   ```

#### I. Additional Resources

- Hyprland Wiki: https://wiki.hyprland.org/
- Pipewire Documentation: https://pipewire.org/
- NetworkManager Documentation: https://networkmanager.dev/
- Dunst Documentation: https://dunst-project.org/documentation/
- Cliphist Documentation: https://github.com/gillesarc/cliphist/wiki

#### J. Debugging Tips

1. **System Logs**
   ```bash
   # Check system logs
   journalctl -b
   
   # Check user logs
   journalctl --user
   ```

2. **Hyprland Debug**
   ```bash
   # Start Hyprland in debug mode
   hyprland -d
   
   # Check IPC
   hyprctl getoption debug:ipc
   ```

3. **Network Debug**
   ```bash
   # Check network status
   nmcli general status
   
   # Check connections
   nmcli connection show
   ```

#### K. Known Issues

1. **Wayland Apps**
   - Some legacy apps may not work properly
   - Try running them with XWayland
   - Report issues to app developers

2. **Audio Apps**
   - Some apps may need pipewire-pulse
   - Some apps may need pipewire-jack
   - Check app documentation

3. **Screen Recording**
   - Some apps may not record properly
   - Try different recording tools
   - Check Wayland protocol version

4. **Clipboard**
   - Some apps may not use Wayland clipboard
   - Try different clipboard managers
   - Check app clipboard integration

#### L. Reporting Issues

1. **Before Reporting**
   - Check logs
   - Try troubleshooting steps
   - Check system updates
   - Check package versions

2. **Include Information**
   - System specs
   - Package versions
   - Error messages
   - Logs
   - Steps to reproduce

3. **Where to Report**
   - Hyprland GitHub: https://github.com/hyprwm/Hyprland/issues
   - Pipewire GitHub: https://github.com/pipewire/pipewire/issues
   - Arch Forums: https://bbs.archlinux.org/

#### M. Maintenance

1. **Regular Updates**
   ```bash
   # Update system
   sudo pacman -Syu
   
   # Update AUR packages
   yay -Syu
   ```

2. **Backup Configs**
   ```bash
   # Backup configs
   cp -r ~/.config/hypr ~/.config/hypr.backup
   
   # Backup keybindings
   cp ~/.config/hypr/keybindings.conf ~/.config/hypr/keybindings.conf.backup
   ```

3. **Clean Cache**
   ```bash
   # Clean package cache
   sudo pacman -Sc
   
   # Clean AUR cache
   yay -Sc
   ```

### 6. Customization

#### Modifying Configuration

1. Backup existing files before editing:
   ```bash
   cp ~/.config/hypr/hyprland.conf ~/.config/hypr/hyprland.conf.backup
   ```

2. Edit configuration files:
   ```bash
   nano ~/.config/hypr/hyprland.conf
   ```

3. Reload Hyprland after changes:
   ```bash
   hyprctl reload
   ```

### 7. Basic Terminal Commands

#### A. Navigation
```bash
# Change directory
cd /path/to/directory

# Go to home directory
cd ~

# Go to parent directory
cd ..

# List files
ls

# List files with details
ls -l

# List all files (including hidden)
ls -la

# List files in long format with size in human readable format
ls -lh
```

#### B. File Operations
```bash
# Create directory
mkdir directory_name

# Create multiple directories
mkdir -p path/to/directory

# Copy file
cp file.txt newfile.txt

# Copy directory
cp -r directory newdirectory

# Move file
mv file.txt newlocation/

# Rename file
mv oldname.txt newname.txt

# Remove file
rm file.txt

# Remove directory
rm -r directory

# Remove directory forcefully
rm -rf directory
```

#### C. File Information
```bash
# View file contents
cat file.txt

# View file contents with line numbers
nl file.txt

# View file contents with paging
less file.txt

# View file size
du -h file.txt

# View directory size
du -sh directory/

# View file permissions
ls -l file.txt

# Change file permissions
chmod 755 file.txt
```

#### D. System Information
```bash
# Check system info
uname -a

# Check CPU info
lscpu

# Check memory info
free -h

# Check disk space
df -h

# Check disk usage
du -sh

# Check network interfaces
ip addr

# Check system uptime
uptime
```

#### E. Process Management
```bash
# List processes
ps aux

# List running processes
top

# List processes with more details
htop

# Kill process
kill <pid>

# Force kill process
kill -9 <pid>

# Search for process
ps aux | grep process_name
```

#### F. Package Management
```bash
# Update system
sudo pacman -Syu

# Install package
sudo pacman -S package_name

# Remove package
sudo pacman -R package_name

# Search for package
pacman -Ss package_name

# List installed packages
pacman -Q

# Show package information
pacman -Qi package_name
```

#### G. Text Editing
```bash
# View file
less file.txt

# View file with line numbers
cat -n file.txt

# Edit file
nano file.txt

# Search in file
grep "search_term" file.txt

# Count lines
wc -l file.txt

# Count words
wc -w file.txt
```

#### H. Network
```bash
# Check IP address
ip addr

# Check network status
ping google.com

# Check network speed
speedtest-cli

# List network interfaces
ip link

# Check DNS settings
cat /etc/resolv.conf

# Check open ports
netstat -tulpn
```

#### I. File Search
```bash
# Search for file
find /path/to/search -name "filename"

# Search for file by type
find /path/to/search -type f

# Search for directories
find /path/to/search -type d

# Search for files by size
find /path/to/search -size +100M

# Search for files modified in last 24 hours
find /path/to/search -mtime -1
```

#### J. Compression
```bash
# Compress file
gzip file.txt

# Decompress file
gunzip file.txt.gz

# Create tar archive
tar -czf archive.tar.gz directory/

# Extract tar archive
tar -xzf archive.tar.gz

# List contents of tar archive
tar -tzf archive.tar.gz
```

#### K. System Logs
```bash
# View system logs
journalctl

# View kernel logs
dmesg

# View specific log file
cat /var/log/syslog

# View log with filtering
journalctl -u service_name

# View recent logs
journalctl --since "10 minutes ago"
```

#### L. File Comparison
```bash
# Compare files
diff file1.txt file2.txt

# Compare directories
diff -r directory1 directory2

# View differences side by side
diff -y file1.txt file2.txt

# Compare files with line numbers
diff -n file1.txt file2.txt

# Compare files with context
diff -C 3 file1.txt file2.txt
```

#### M. File Permissions
```bash
# Change file ownership
chown user:group file.txt

# Change directory ownership
chown -R user:group directory/

# Change file permissions
chmod 755 file.txt

# Change directory permissions
chmod -R 755 directory/

# Set executable permission
chmod +x script.sh
```

#### N. Environment
```bash
# View environment variables
env

# View specific variable
echo $PATH

# Set environment variable
export VARIABLE=value

# View current shell
ps -p $$

# View shell aliases
alias
```

#### O. System Monitoring
```bash
# Monitor CPU usage
top

# Monitor memory usage
free -h

# Monitor disk usage
df -h

# Monitor network traffic
iftop

# Monitor system load
uptime
```

#### P. File Editing
```bash
# Create new file
touch file.txt

# Edit file
nano file.txt

# View file with line numbers
nl file.txt

# View file in pages
less file.txt

# View file with syntax highlighting
bat file.txt
```

#### B. Audio Control
```bash
# Increase volume
pamixer --increase 5

# Decrease volume
pamixer --decrease 5

# Toggle mute
pamixer --toggle-mute

# Set volume
pamixer --set-volume <value>

# List audio devices
pamixer --list-sinks
```

#### C. Display Control
```bash
# Increase brightness
brightnessctl set +5%

# Decrease brightness
brightnessctl set 5%-

# List displays
hyprctl monitors

# Configure monitor
hyprctl keyword monitors "<monitor-name> position <x> <y>"
```

#### D. Screenshot Commands
```bash
# Full screen screenshot
grim ~/Pictures/screenshots/$(date +%Y-%m-%d_%H-%M-%S)_full.png

# Selected area screenshot
slurp | grim -g - ~/Pictures/screenshots/$(date +%Y-%m-%d_%H-%M-%S).png

# View screenshots
ls ~/Pictures/screenshots/
```

#### E. Clipboard Management
```bash
# Show clipboard history
cliphist show

# Clear clipboard history
cliphist clear

# Store text in clipboard
echo "text" | cliphist store

# Paste from clipboard
cliphist paste
```

#### F. Audio Visualization
```bash
# Start cava
cava

# Stop cava
pkill cava

# List audio sources
cava -l

# Configure cava
cava -p
```

#### G. System Management
```bash
# Reload configuration
hyprctl reload

# List workspaces
hyprctl workspaces

# List windows
hyprctl clients

# List keybindings
hyprctl getbinds

# List monitors
hyprctl monitors
```

#### H. Process Management
```bash
# Open htop
htop

# Kill process
kill <pid>

# Force kill process
kill -9 <pid>

# List processes
ps aux
```

#### I. Network Management
```bash
# Check network status
nmcli general status

# List connections
nmcli connection show

# Connect to WiFi
nmcli device wifi connect <SSID> password <password>

# Check IP address
ip addr
```

#### J. Notification Control
```bash
# Show notification history
dunstctl history-pop

# Clear notifications
dunstctl close-all

# Toggle notifications
dunstctl set-paused toggle

# Configure dunst
dunstctl set-paused true|false
```

#### K. Media Controls
```bash
# Play/Pause
playerctl play-pause

# Next track
playerctl next

# Previous track
playerctl previous

# Set volume
playerctl volume <value>

# List players
playerctl --list-all
```

#### L. Hyprland Debug
```bash
# Start in debug mode
hyprland -d

# Check IPC status
hyprctl getoption debug:ipc

# Get debug info
hyprctl debuginfo

# Get version
hyprctl version
```

#### M. Wayland Utilities
```bash
# Check clipboard
wl-paste

# Copy to clipboard
echo "text" | wl-copy

# Screen recording
wf-recorder --output ~/screencast.mp4

# Screen capture
grim
```

#### N. System Services
```bash
# Check pipewire status
systemctl --user status pipewire

# Check NetworkManager status
systemctl --user status NetworkManager

# Check dunst status
systemctl --user status dunst

# Check cliphist status
systemctl --user status cliphist
```

#### O. Package Management
```bash
# Update system
sudo pacman -Syu

# Install package
sudo pacman -S <package>

# Remove package
sudo pacman -R <package>

# Search package
pacman -Ss <package>

# Update AUR packages
yay -Syu
```

#### P. System Information
```bash
# System info
neofetch

# CPU info
cat /proc/cpuinfo

# Memory info
free -h

# Disk usage
df -h

# System logs
journalctl -b
```

#### Adding New Applications

1. Add workspace rules in `windowrules.conf`
2. Add keybindings in `keybindings.conf`
3. Add notifications in `dunst.conf`
4. Add status bar modules in `waybar.conf`

### 7. Uninstallation

To remove the setup:

```bash
# Stop services
systemctl --user disable --now pipewire
systemctl --user disable --now NetworkManager
systemctl --user disable --now dunst
systemctl --user disable --now cliphist

# Remove configuration
rm -rf ~/.config/hypr

# Remove packages
sudo pacman -Rns hyprland pipewire networkmanager dunst cliphist
```
mkdir -p ~/.config/hypr
git clone https://github.com/yourusername/minimal-hyprland.git ~/.config/hypr
```

### 3. Run Installation Script

```bash
cd ~/.config/hypr/minimal-hyprland
chmod +x install.sh
./install.sh
```

The installation script will:
- Install all required packages from pkg_minimal.lst
- Copy configuration files to appropriate locations
- Enable necessary services
- Set up basic window rules
- Configure audio visualization

### 4. Post-Installation Steps

1. Log out of your current session
2. Select Hyprland from your display manager
3. Log back in
4. Verify all services are running:
```bash
systemctl --user status pipewire
systemctl --user status pipewire-pulse
```

## Configuration Structure

```
minimal-hyprland/
├── configs/                 # Organized configuration files
│   ├── audio/              # Audio-related configurations
│   │   ├── cava.conf      # Cava audio visualizer config
│   │   └── playerctl.conf # Media control configuration
│   ├── display/           # Display-related configurations
│   │   └── grim.conf      # Screenshot tool configuration
│   ├── shell/             # Shell-related configurations
│   │   ├── starship.toml  # Shell prompt configuration
│   │   └── eza.conf       # File lister configuration
│   └── window/            # Window manager configurations
│       ├── waybar.conf    # System bar configuration
│       └── windowrules.conf # Window management rules
├── hyprland.conf          # Main Hyprland configuration
├── keybindings.conf       # Keyboard shortcuts
├── pkg_minimal.lst        # List of required packages
└── install.sh             # Installation script
```

## Customization

To customize any configuration, simply edit the corresponding file in the `configs/` directory. After making changes, you may need to reload the relevant service or configuration.

### Wallpaper Configuration

1. Place your wallpapers in `~/.config/hypr/wallpapers/`
2. Supported formats: PNG, JPG
3. Configure wallpaper settings in `configs/wallpapers/wallpaper.conf`
4. Use `change_wallpaper.sh` to change wallpaper randomly
5. Set wallpaper using `hyprctl dispatch wallpaper * <path>`

### Other Customizations

1. Edit the appropriate config file in the `configs/` directory
2. Restart the relevant service or reload Hyprland
3. For Hyprland-specific changes:
```bash
hyprctl reload
```

## Troubleshooting

If you encounter any issues:

1. Check the Hyprland logs:
```bash
hyprctl getlog
```

2. Verify package installation:
```bash
pacman -Ql <package>
```

3. Check configuration syntax in relevant config files

4. Common issues:
   - Audio not working: Check pipewire status
   - Waybar not showing: Check waybar.conf syntax
   - Keybindings not working: Check keybindings.conf

## Support

For support or reporting issues:

1. Check the Hyprland Discord server
2. Search existing issues on GitHub
3. Create a new issue with detailed information

## License

MIT License - feel free to modify and use this configuration as you see fit.
