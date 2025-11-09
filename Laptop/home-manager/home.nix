{ config, pkgs, ... }:

{
  home.username = "yavuz";
  home.homeDirectory = "/home/yavuz";

  nixpkgs.config.allowUnfree = true;

  #Packages
  home.packages = [
    pkgs.nautilus
    pkgs.firefox
    pkgs.vscodium
    pkgs.neofetch
    pkgs.gnome-software
    pkgs.polkit
    pkgs.ntfs3g
    pkgs.vesktop
    pkgs.gdlauncher-carbon
  ];
 #--------

  programs.kitty = {
    enable = true;
    
    font = {
      name = "JetBrains Mono Nerd Font";
      size = 11.0;
    };
    
    settings = {
      # Cursor
      cursor_shape = "beam";
      cursor_trail = 1;
      
      # Padding
      window_margin_width = "21.75";
      
      # No stupid close confirmation
      confirm_os_window_close = 0;
    };
    
    keybindings = {
      # Copy
      "ctrl+c" = "copy_or_interrupt";
      
      # Search
      "ctrl+f" = "launch --location=hsplit --allow-remote-control kitty +kitten search.py @active-kitty-window-id";
      "kitty_mod+f" = "launch --location=hsplit --allow-remote-control kitty +kitten search.py @active-kitty-window-id";
      
      # Scroll
      "page_up" = "scroll_page_up";
      "page_down" = "scroll_page_down";
      
      # Zoom
      "ctrl+plus" = "change_font_size all +1";
      "ctrl+equal" = "change_font_size all +1";
      "ctrl+kp_add" = "change_font_size all +1";
      "ctrl+minus" = "change_font_size all -1";
      "ctrl+underscore" = "change_font_size all -1";
      "ctrl+kp_subtract" = "change_font_size all -1";
      "ctrl+0" = "change_font_size all 0";
      "ctrl+kp_0" = "change_font_size all 0";
    };
  };
  home.file = {

  };

  home.sessionVariables = {

  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
