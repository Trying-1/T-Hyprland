# Packages Documentation

## System

- hyprland: Wayland compositor and window manager
- pipewire: Audio/video server and compositor
  - pipewire-pulse: PulseAudio compatibility layer
  - pamixer: Volume control
  - playerctl: Media controls
  - cava: Audio visualization
- networkmanager: Network management
  - network-manager-applet: Network status icon
- brightnessctl: Screen brightness control
- wlogout: Screen locker
- xdg-user-dirs: User directory management
- base-devel: Development tools
- git: Version control
- yay: AUR package manager

## Display

- xorg-xwayland: XWayland support
- noto-fonts: Unicode fonts
  - noto-fonts-emoji: Emoji support
- ttf-font-awesome: Icons
- grim: Screenshot tool
- slurp: Region selector
- hyprpaper: Wallpaper manager
- wofi-wayland: Application launcher
- waybar: Status bar
- dunst: Notification daemon
- cliphist: Clipboard manager

## Desktop Portals

### Desktop Portals
- xdg-desktop-portal: Core desktop portal
- xdg-desktop-portal-kde: KDE-specific portal
- xdg-desktop-portal-gtk: GTK-specific portal
- xdg-desktop-portal-hyprland: Hyprland-specific portal
- xdg-desktop-portal-wlr: Wayland-specific portal

### network-manager-applet
- System tray icon for network status
- Quick access to network settings
- Shows current connection status
- Network configuration

### brightnessctl
- Command-line tool for screen brightness
- Supports multiple screens
- Can be used in scripts and keybindings
- Per-screen brightness control

### playerctl
- Controls media players across applications
- Provides media control integration
- Supports MPRIS-compatible players
- Volume control
- Playback control

### cava
- Real-time audio visualization
- Multiple visualization modes
- Configurable colors and effects
- Customizable size and position
- Toggleable via keybinding

## Display Packages

### xorg-xwayland
- Provides XWayland support for legacy applications
- Enables running X11 apps in Wayland
- Seamless integration with Wayland apps

### hyprpaper
- Wayland-native wallpaper manager
- Multiple wallpaper modes
- Per-workspace wallpapers
- Blur and opacity effects
- Random wallpaper rotation

### wofi-wayland
- Wayland-native application launcher
- Fast and efficient
- Customizable appearance
- Supports icons
- Searchable app list

### waybar
- Highly customizable status bar
- Modular design
- Supports multiple modules
- Configurable appearance
- Real-time updates

### dunst
- Notification daemon
- Customizable appearance
- Supports icons
- Multiple notification priorities
- Custom actions

### cliphist
- Clipboard manager
- History support
- Searchable clipboard
- Customizable shortcuts
- Multiple formats support

## Development Tools

### base-devel
- Essential development tools
- Build system
- Package management
- Development libraries
- Debugging tools

### git
- Version control system
- Repository management
- Branching and merging
- Remote repositories
- History management

### yay
- AUR package manager
- Automatic AUR package installation
- Dependency resolution
- Package updates
- Custom build options

## Configuration Files

- hyprland.conf: Main window manager configuration
- keybindings.conf: Keyboard shortcuts and bindings
- monitors.conf: Display settings
- windowrules.conf: Window management rules
- audio.conf: Audio settings
- display.conf: Display settings
- screenshots.conf: Screenshot settings
- prompt.conf: Shell prompt configuration
- listing.conf: File listing configuration
- hyprpaper.conf: Wallpaper settings
- waybar.conf: Status bar configuration
- dunst.conf: Notification settings
- cliphist.conf: Clipboard settings
- cava.conf: Audio visualization settings
- Enables X11 applications on Wayland
- Provides X11 protocol support
- Required for legacy applications

### xorg-xwayland-xwayland
- Compositor for XWayland applications
- Handles X11 window management
- Provides seamless integration

### noto-fonts
- Comprehensive font collection
- Supports multiple languages
- Includes CJK and other international characters

### noto-fonts-emoji
- Complete emoji font set
- Supports modern emoji standards
- Includes all common emoji characters

### ttf-font-awesome
- Icon font for applications
- Provides consistent icons
- Used in waybar and other UI elements

## Window Manager Packages

### hyprland
- Main window manager
- Handles window management
- Provides tiling and floating layouts

### waybar
- System status bar
- Shows system information
- Highly customizable modules

### wofi
- Modern Wayland application launcher
- Wayland-native
- Lightweight and fast
- Modern UI design
- Supports themes
- Wayland-compatible

### hyprpaper
- Wallpaper manager for Hyprland
- Wayland-native
- Supports multiple wallpapers
- Random wallpaper rotation
- Per-workspace wallpapers
- Blur and opacity effects
- Tinting support
- Hot-reload support

#### hyprpaper Features
- Wallpaper modes:
  - fill
  - fit
  - stretch
  - tile
  - center

- Effects:
  - Blur (0-100)
  - Opacity (0-100)
  - Tinting with custom colors

- Configuration:
  - Random wallpaper rotation
  - Change interval
  - Per-workspace wallpapers
  - Waybar integration

- Usage:
  - Start with: `hyprpaper`
  - Hot-reload with: `killall hyprpaper && hyprpaper`
  - Change wallpaper: `hyprpaperctl set <path>`

#### Customization Options
- Appearance:
  - Custom font support (JetBrains Mono Nerd Font)
  - Color scheme customization
  - Border radius and padding
  - Background transparency

- Window Settings:
  - Custom window dimensions
  - Border styling
  - Rounded corners
  - Background colors

- Item Styling:
  - Hover effects
  - Selection highlighting
  - Active/inactive states
  - Urgent items
  - Disabled items
  - Placeholder text

- Configuration File:
  - Located at `~/.config/wofi/config`
  - Supports multiple themes
  - Customizable through environment variables
  - Hot-reload support

### grim
- Screenshot capture utility
- Supports full screen and region capture
- Wayland-compatible screenshot tool

### slurp
- Region selection for screenshots
- Wayland-compatible region picker
- Used with grim for precise captures

### cliphist
- Clipboard history management
- Stores previous clipboard contents
- Accessible via keybindings

## Application Packages

### kitty
- Fast and efficient terminal
- Supports Wayland
- Configurable appearance

### thunar
- File management
- Wayland-compatible interface
- Quick file operations

## Utility Packages

### htop
- Process monitoring
- Resource usage display
- Interactive process viewer

### neofetch
- System information display
- Shows hardware and OS details
- Customizable display

### dunst
- Notification daemon
- Wayland-compatible notifications
- Customizable appearance

### xclip
- Command-line clipboard utilities
- Copy/paste from terminal
- Supports multiple selections

## Development Tools

### git-delta
- Enhanced git diff viewer
- Colorized diffs
- Side-by-side comparison

### ripgrep
- Fast text-based search
- Supports regex
- Smart case and smart Unicode

### fd
- Smart file finder
- Fast directory search
- Supports regex patterns

## Dependencies

### polkit-gnome
- Authentication agent
- Required for privileged operations
- Wayland-compatible

### dbus-user-session
- User session bus
- Required for Wayland
- Handles user session management

### xdg-desktop-portal-hyprland
- XDG desktop portal
- Required for Wayland applications
- Provides desktop integration

### xdg-desktop-portal-gtk
- GTK-based XDG portal
- Required for GTK applications
- Provides GTK integration

### xdg-user-dirs
- Manages user directories
- Follows freedesktop.org standard
- Creates standard directories

### pacman-contrib
- Additional Pacman utilities
- Provides extra scripts
- Includes package management tools

## Shell Packages

### zsh
- Advanced shell
- Customizable prompt
- Extensive completion system

### eza
- Modern replacement for ls
- Colorized output
- Supports icons

### starship
- Fast shell prompt
- Customizable appearance
- Supports multiple modules
