#!/bin/bash

# Create required directories
mkdir ~/.vim
mkdir -p ~/.config/{bspwm,nvim,sxhkd,dunst,polybar,kitty,neomutt}
mkdir ~/.config/nvim/configs

# Editor configs 
ln -sf ~/configs/editor/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/configs/editor/.config/nvim/configs/general.vimrc ~/.config/nvim/configs/general.vimrc
ln -sf ~/configs/editor/.config/nvim/configs/init.vimrc ~/.config/nvim/configs/init.vimrc
ln -sf ~/configs/editor/.config/nvim/configs/plugins.vimrc ~/.config/nvim/configs/plugins.vimrc
ln -sf ~/configs/editor/.config/nvim/configs/keybinds.vimrc ~/.config/nvim/configs/keybinds.vimrc
ln -sf ~/configs/editor/.config/nvim/configs/lightline.vimrc ~/.config/nvim/configs/lightline.vimrc
ln -sf ~/configs/.vim/coc-settings.json ~/.vim/coc-settings.json

# Git config
ln -sf ~/configs/git/.gitconfig ~/.gitconfig

# Window manager (bspwm + sxhkd + dunst) configs
ln -sf ~/configs/gui/.config/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
ln -sf ~/configs/gui/.config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
ln -sf ~/configs/gui/.config/dunst/dunstrc ~/.config/dunst/dunstrc
ln -sf ~/configs/gui/.config/polybar/config ~/.config/polybar/config
ln -sf ~/configs/gui/.config/polybar/launch.sh ~/.config/polybar/launch.sh

# X configs
ln -sf ~/configs/gui/.xprofile ~/.xprofile
ln -sf ~/configs/peripherals/etc/X11/xorg.conf.d/52-tablet.conf /etc/X11/xorg.conf.d/52-tablet.conf
ln -sf ~/configs/peripherals/etc/X11/xorg.conf.d/50-mouse-acceleration.conf /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
ln -sf ~/configs/gui/.xinitrc ~/.xinitrc

# Shell configs
ln -sf ~/configs/shell/.bashrc ~/.bashrc
ln -sf ~/configs/shell/.p10k.zsh ~/.p10k.zsh
ln -sf ~/configs/shell/.zshrc ~/.zshrc
ln -sf ~/configs/shell/.tmux.conf ~/.tmux.conf

# Terminal configs
ln -sf ~/configs/gui/.config/kitty/kitty.conf ~/.configs/kitty/kitty.conf
ln -sf ~/configs/gui/.config/kitty/theme.conf ~/.configs/kitty/theme.conf

# Mail client
ln -sf ~/configs/mail/.config/buzz.toml ~/.config/buzz.toml
ln -sf ~/configs/mail/.config/neomutt/neomuttrc ~/.config/neomutt/neomuttrc
