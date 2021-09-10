#!/bin/bash

# Create required directories
mkdir ~/.vim
mkdir -p ~/.config/{bspwm,nvim,sxhkd,dunst,polybar,kitty}

# Editor configs 
ln -sf ~/configs/editor/.config/nvim/init.vim ~/.config/nvim/init.vim

# Window manager (bspwm + sxhkd + dunst) configs
ln -sf ~/configs/gui/.config/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
ln -sf ~/configs/gui/.config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
ln -sf ~/configs/gui/.config/dunst/dunstrc ~/.config/dunst/dunstrc
ln -sf ~/configs/gui/.config/polybar/config ~/.config/polybar/config
ln -sf ~/configs/gui/.config/polybar/launch.sh ~/.config/polybar/launch.sh

# X configs
ln -sf ~/configs/gui/.xprofile ~/.xprofile
ln -sf ~/configs/gui/.xinitrc ~/.xinitrc

# Shell configs
ln -sf ~/configs/shell/.bashrc ~/.bashrc
ln -sf ~/configs/shell/.p10k.zsh ~/.p10k.zsh
ln -sf ~/configs/shell/.zshrc ~/.zshrc
ln -sf ~/configs/shell/.tmux.conf ~/.tmux.conf

# Terminal configs
ln -sf ~/configs/gui/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/configs/gui/.config/kitty/theme.conf ~/.config/kitty/theme.conf
