{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./network.nix
    ];

  #Boot  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #------
  

  services.logind.extraConfig = ''
  HandlePowerKey=ignore
  '';

  #Network
  networking.hostName = "Nixos-Laptop";
  networking.networkmanager.enable = true;
  networking.wireless.userControlled.enable = true;
  #------

  #Local
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  #------

  #Keyboard
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  #-----
  #User
  users.users.$user = {
    isNormalUser = true;
    home = "/home/$user";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };

  #-------

  #Nix Features
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  #------

  #Packages
  services.flatpak.enable = true;
  environment.systemPackages = with pkgs; [
     git
     home-manager
     gnome-software
  ];
  #-------
  
  #Login-Service
  services = {  
    xserver.enable = true;
    xserver.displayManager.gdm.enable = true;
  };  
  #-------

  #Window Manager
  programs.hyprland = {
   enable = true;
   xwayland.enable = true;
  };

  system.stateVersion = "25.05";

}
