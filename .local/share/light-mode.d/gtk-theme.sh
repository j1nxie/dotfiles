#!/bin/sh

gsettings set org.gnome.desktop.interface gtk-theme Catppuccin-Latte-Standard-Rosewater-Light
gsettings set org.gnome.desktop.interface color-scheme prefer-light
export BAT_THEME="Catppuccin-latte"
fish --command="set -U BAT_THEME Catppuccin-latte"
kitty +kitten themes --reload-in=all Catppuccin-Latte
kvantummanager --set Catppuccin-Latte-Rosewater
ln -sf ~/.config/waybar/latte.css ~/.config/waybar/theme.css
ln -sf ~/.config/swaync/latte.css ~/.config/swaync/style.css
killall -SIGUSR2 waybar
swaync-client -rs
