{ config, pkgs, inputs, ... }:

{
  home.username = "yavuz";
  home.homeDirectory = "/home/yavuz";

  programs.home-manager.enable = true;


   wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;

    settings = {
        exec-once = [
         "export DMS_DISABLE_MATUGEN=1 && dms run"
       ];
    };
  };
}
