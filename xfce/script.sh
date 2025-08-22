#!/usr/bin/env bash

sudo mv -r /etc/nixos/hardware-configuration.nix ~/dotfiles/xfce/
sudo mv -r /etc/nixos/configuration.nix ~/dotfiles/xfce/

sudo cat ~/dotfiles/xfce/hardware-configuration.nix | sudo tee -a ~/dotfiles/xfce/hardware-configuration (1).nix

sudo cp -r ~/dotfiles/xfce/configuration (1).nix
sudo cp -r ~/dotfiles/xfce/hardware-configuration (1).nix
sudo cp -r ~/dotfiles/xfce/network (1).nix
sudo cp -r ~/dotfiles/xfce/xfce.nix


echo "finished copying"
