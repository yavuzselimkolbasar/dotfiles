{ config, pkgs, callPackage, ... }: {
  services.xserver = {
    enable = true;   
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };
    windowManager.i3.enable = true;
  };
  services.displayManager.defaultSession = "xfce";
  services = {

    displayManager.sddm.enable = true;

    displayManager.sddm.wayland.enable = true;
  }
}
