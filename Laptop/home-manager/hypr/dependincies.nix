{ config, pkgs, inputs, ... }:

{
  home.username = "$user";
  home.homeDirectory = "/home/$user";
  programs.home-manager.enable = true;

    xdg.configFile."gtk-3.0/settings.ini".force = true;
  xdg.configFile."gtk-4.0/settings.ini".force = true;

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

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

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

  qt = {
    enable = true;
    platformTheme.name = "qt5ct";
    style = {
      package = pkgs.whitesur-gtk-theme;
      name = "WhiteSur-Dark";
    };
  };

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

  gtk.gtk2.configLocation = "${config.home.homeDirectory}/.gtkrc-2.0";
  gtk.gtk2.extraConfig = ''
    gtk-theme-name="WhiteSur-Dark"
    gtk-icon-theme-name="WhiteSur-dark"
    gtk-cursor-theme-name="Bibata-Modern-Classic"
    gtk-cursor-theme-size=24
    gtk-font-name="Sans 10"
    gtk-application-prefer-dark-theme=1
  '';

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
