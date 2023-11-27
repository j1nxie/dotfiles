#!/bin/sh

gsettings set org.gnome.desktop.interface gtk-theme Catppuccin-Macchiato-Standard-Rosewater-Dark
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
export BAT_THEME="Catppuccin-macchiato"
fish --command="set -U BAT_THEME Catppuccin-macchiato"
kitty +kitten themes --reload-in=all Catppuccin-Macchiato
kvantummanager --set Catppuccin-Macchiato-Rosewater
ln -sf ~/.config/waybar/macchiato.css ~/.config/waybar/theme.css
ln -sf ~/.config/swaync/macchiato.css ~/.config/swaync/theme.css
killall -SIGUSR2 waybar
swaync-client -rs
nwg-look -x
