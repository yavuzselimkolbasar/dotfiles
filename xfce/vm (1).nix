{ config, pkgs, ... }:

{

    virtualisation.docker.enable = true;
  virtualisation.docker.storageDriver = "btrfs";

}

