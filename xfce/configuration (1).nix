
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./vm.nix 
      ./xfce.nix
      ./network.nix
   ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  programs.gamemode.enable = true;
  networking.hostName = "nixos"; # Define your hostname.
  services.flatpak.enable = true;
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Berlin";

i18n.supportedLocales = [ "en_US.UTF-8" "tr_TR.UTF-8" ];
i18n.defaultLocale = "en_US.UTF-8"; 

i18n.extraLocaleSettings = {
  LC_ADDRESS        = "tr_TR.UTF-8";
  LC_IDENTIFICATION = "tr_TR.UTF-8";
  LC_MEASUREMENT    = "tr_TR.UTF-8";
  LC_MONETARY       = "tr_TR.UTF-8";
  LC_NAME           = "tr_TR.UTF-8";
  LC_NUMERIC        = "tr_TR.UTF-8";
  LC_PAPER          = "tr_TR.UTF-8";
  LC_TELEPHONE      = "tr_TR.UTF-8";
  LC_TIME           = "tr_TR.UTF-8";
};


  services.pipewire = {
    enable = true;
    wireplumber.enable = true;  # replaces media-session
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.enableAllFirmware = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users.$user = {
    isNormalUser = true;
    description = "$user";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
   kdePackages.systemsettings
   github-desktop
   gdlauncher-carbon
   kdePackages.konsole  
   kdePackages.dolphin
   vscodium
   librewolf
   mesa
   git
   wayland-utils
   wl-clipboard
   neofetch
   gnome-software
   qt6.qtbase
   mangohud
   davinci-resolve
   polkit
   nodejs
   python
   slack
   postman
   code-cursor
   ntfs3g
   steam
   discord
  ];

  system.stateVersion = "25.05"; # Did you read the comment?

}
 

