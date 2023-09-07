#!/bin/sh

gsettings set org.gnome.desktop.interface gtk-theme Catppuccin-Macchiato-Standard-Rosewater-dark
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
export BAT_THEME="Catppuccin-macchiato"
fish --command="set -U BAT_THEME Catppuccin-macchiato"
