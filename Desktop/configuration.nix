
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./vm.nix 
      ./kde.nix
      ./network.nix
   ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  programs.gamemode.enable = true;
  networking.hostName = "nixos"; # Define your hostname.
  services.flatpak.enable = true;
  networking.networkmanager.enable = true;
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
    extraGroups = [ "networkmanager" "wheel" "qemu-libvirtd" ];
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
   kitty
   wayland-utils
   wl-clipboard
   neofetch
   gnome-software
   qt6.qtbase
   mangohud
   davinci-resolve
   polkit
   gnome-text-editor
   nodejs
   eog
   ntfs3g
   steam
   vesktop
  ];

  system.stateVersion = "25.05"; # Did you read the comment?

}
 

