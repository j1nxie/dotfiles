#!/bin/sh

gsettings set org.gnome.desktop.interface gtk-theme Catppuccin-Latte-Standard-Rosewater-light
gsettings set org.gnome.desktop.interface color-scheme prefer-light
export BAT_THEME="Catppuccin-latte"
fish --command="set -U BAT_THEME Catppuccin-latte"
