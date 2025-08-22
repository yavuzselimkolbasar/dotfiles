#!/usr/bin/env bash

sudo cp -r ~/dotfiles/xfce/configuration (1).nix /etc/nixos/
sudo cp -r ~/dotfiles/xfce/hardware-configuration (1).nix /etc/nixos/
sudo cp -r ~/dotfiles/xfce/network (1).nix /etc/nixos/
sudo cp -r ~/dotfiles/xfce/xfce.nix /etc/nixos/


echo "finished copying"
