{ config, pkgs, inputs, ... }:

{
  home.username = "$user";
  home.homeDirectory = "/home/$user";

  programs.home-manager.enable = true;


   wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;

    settings = {
        exec-once = [
         "export DMS_DISABLE_MATUGEN=1 && dms run"
         "vesktop -m --start-minimazed-to-tray"
         "systemctl --user import-environment DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
         "hyprsession"
         "swaybg -i /home/yavuz/Pictures/Wallpapers/b-360.jpg"
       ];
    };
  };
}
