{ config, pkgs, ... }:

{
  home.username = "$user";
  home.homeDirectory = "/home/$user";

  nixpkgs.config.allowUnfree = true;

  #Packages
  home.packages = [
    pkgs.nautilus
    pkgs.firefox
    pkgs.kitty
    pkgs.kdePackages.dolphin
    pkgs.vscodium
    pkgs.neofetch
    pkgs.gnome-software
    pkgs.mangohud
    pkgs.polkit
    pkgs.gnome-text-editor
    pkgs.nodejs
    pkgs.eog
    pkgs.ntfs3g
    pkgs.steam
    pkgs.vesktop
    pkgs.gdlauncher-carbon
  ];
 #--------


  home.file = {

  };

  home.sessionVariables = {

  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
