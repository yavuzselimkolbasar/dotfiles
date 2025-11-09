{ config, pkgs, ... }:

{
  home.username = "$user";
  home.homeDirectory = "/home/$user";

  nixpkgs.config.allowUnfree = true;

  #Packages
  home.packages = with pkgs; [
    nautilus
    firefox
    vscodium
    neofetch
    ntfs3g
    vesktop
    gdlauncher-carbon
    unzip
    hyprshot
    spotify-player
    eog
    steam
    libgnome-keyring
    spotify
 ];   


 #--------

   
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-hyprland xdg-desktop-portal-gtk ];
  };


  programs.kitty = {
    enable = true;
    
    font = {
      name = "JetBrains Mono Nerd Font";
      size = 11.0;
    };
    
    settings = {
      cursor_shape = "beam";
      cursor_trail = 1;
      window_margin_width = "21.75";
      confirm_os_window_close = 0;
      background_opacity = 0.2;  # 0.0 is fully transparent, 1.0 is fully opaque
    };
    
    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
      "ctrl+f" = "launch --location=hsplit --allow-remote-control kitty +kitten search.py @active-kitty-window-id";
      "kitty_mod+f" = "launch --location=hsplit --allow-remote-control kitty +kitten search.py @active-kitty-window-id";
      
      "page_up" = "scroll_page_up";
      "page_down" = "scroll_page_down";
      
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
