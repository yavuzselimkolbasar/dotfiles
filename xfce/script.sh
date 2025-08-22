#!/usr/bin/env bash

sudo cp -r /etc/nixos/hardware-configuration.nix ~/dotfiles/xfce
sudo cp -r /etc/nixos/configuration.nix ~/dotfiles/xfce
sudo rm -rf /etc/nixos/hardware-configuration.nix
sudo rm -rf /etc/nixos/configuration.nix

sudo cat /etc/nixos/hardware-configuration.nix | sudo tee -a /home/yavuz/configs/hardware-configuration (1).nix

sudo cp -r ~/dotfiles/xfce/configuration (1).nix
sudo cp -r ~/dotfiles/xfce/hardware-configuration (1).nix
sudo cp -r ~/dotfiles/xfce/network (1).nix
sudo cp -r ~/dotfiles/xfce/xfce.nix


echo "finished copying"
