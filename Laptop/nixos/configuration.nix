{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  #Boot  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  #------

  #Network
  networking.hostName = "Nixos-Laptop";
  networking.networkmanager.enable = true;
  networking.wireless.userControlled.enable = true;
  #------

  #Local
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };
  #------

  #Keyboard
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  #-------

  #User
  users.users.$user = {
    isNormalUser = true;
    description = "$description";
    home = "/home/$user";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  #-------

  #Nix Features
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  #------

  #Packages
  environment.systemPackages = with pkgs; [
     git
     home-manager
  ];
  #-------
  
  #Login-Service
  services = {
   displayManager.sddm.enable = true;
   displayManager.sddm.wayland.enable = true;
  };
  #-------

  #Window Manager
  programs.hyprland = {
   enable = true;
   xwayland.enable = true;
  };

  system.stateVersion = "25.05";

}
