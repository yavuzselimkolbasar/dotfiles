{ config, pkgs, inputs, ... }:

{
  home.username = "yavuz";
  home.homeDirectory = "/home/yavuz";

  programs.home-manager.enable = true;

  # Dank Material Shell
  programs.dankMaterialShell = {
    enable = true;
    enableDynamicTheming = false;
    enableSystemMonitoring = true;
    enableClipboard = true;
    enableVPN = true;
    enableBrightnessControl = true;
    enableColorPicker = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
    enableSystemSound = true;
  };

  # Pointer Cursor
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  # GTK Configuration
  gtk = {
    enable = true;
    theme = {
      package = pkgs.whitesur-gtk-theme;
      name = "WhiteSur-Dark";
    };
    iconTheme = {
      package = pkgs.whitesur-icon-theme;
      name = "WhiteSur-dark";
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  # Qt Configuration
  qt = {
    enable = true;
    platformTheme.name = "qt5ct";
    style = {
      package = pkgs.whitesur-gtk-theme;
      name = "WhiteSur-Dark";
    };
  };

  # Dconf (GNOME/GTK settings)
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "WhiteSur-Dark";
      icon-theme = "WhiteSur-dark";
      cursor-theme = "Bibata-Modern-Classic";
      cursor-size = 24;
      font-antialiasing = "rgba";
      font-hinting = "slight";
    };
    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
      search-filter-time-type = "last_modified";
    };
  };

  # Environment Variables
  home.sessionVariables = {
    GTK_THEME = "WhiteSur-Dark";
    GTK2_RC_FILES = "${config.home.homeDirectory}/.gtkrc-2.0";
    QT_STYLE_OVERRIDE = "WhiteSur-Dark";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
    GTK_USE_PORTAL = "1";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    XDG_DATA_DIRS = "$HOME/.nix-profile/share:$XDG_DATA_DIRS";
  };

  # Installed Packages
  home.packages = with pkgs; [
    whitesur-gtk-theme
    whitesur-icon-theme
    bibata-cursors
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qt6ct
    gnome-themes-extra
    gsettings-desktop-schemas
    glib
  ];

  # GTK2 Compatibility
  gtk.gtk2.configLocation = "${config.home.homeDirectory}/.gtkrc-2.0";
  gtk.gtk2.extraConfig = ''
    gtk-theme-name="WhiteSur-Dark"
    gtk-icon-theme-name="WhiteSur-dark"
    gtk-cursor-theme-name="Bibata-Modern-Classic"
    gtk-cursor-theme-size=24
    gtk-font-name="Sans 10"
    gtk-application-prefer-dark-theme=1
  '';

  # XDG Configuration
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
    config.common.default = "*";
  };
}
