#!/usr/bin/env bash

sudo cp -r /etc/nixos/hardware-configuration.nix ~/dotfiles/xfce
sudo cp -r /etc/nixos/configuration.nix ~/dotfiles/xfce
sudo mv /etc/nixos/hardware-configuration.nix /etc/nixos/hardware-configuration-backup.nix
sudo mv /etc/nixos/configuration.nix /etc/nixos/configuration-backup.nix

sudo cp -r ~/dotfiles/xfce/configuration1.nix /etc/nixos/
sudo cp -r ~/dotfiles/xfce/hardware-configuration1.nix /etc/nixos/
sudo cp -r ~/dotfiles/xfce/network1.nix /etc/nixos/
sudo cp -r ~/dotfiles/xfce/xfce.nix /etc/nixos/


echo "finished copying"