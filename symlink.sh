#!/bin/bash

mkdir ~/.vim
mkdir -p ~/.config/{bspwm,nvim,sxhkd}
ln -sf ./editor/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ./editor/.vim/coc-settings.json ~/.vim/coc-settings.json
ln -sf ./git/.gitconfig ~/.gitconfig
ln -sf ./gui/.config/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
ln -sf ./gui/.config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
ln -sf ./gui/.xprofile ~/xprofile
ln -sf ./peripherals/etc/X11/xorg.conf.d/52-tablet.conf /etc/X11/xorg.conf.d/52-tablet.conf
ln -sf ./peripherals/etc/X11/xorg.conf.d/50-mouse-acceleration.conf /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
ln -sf ./shell/.bashrc ~/.bashrc
ln -sf ./shell/.p10k.zsh ~/.p10k.zsh
ln -sf ./shell/.zshrc ~/.zshrc
