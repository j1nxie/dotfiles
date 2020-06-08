#!/bin/bash

mkdir ~/.vim
mkdir -p ~/.config/{bspwm,nvim,sxhkd}
ln -sf ~/configs/editor/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/configs/.vim/coc-settings.json ~/.vim/coc-settings.json
ln -sf ~/configs/git/.gitconfig ~/.gitconfig
ln -sf ~/configs/gui/.config/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
ln -sf ~/configs/gui/.config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
ln -sf ~/configs/gui/.xprofile ~/.xprofile
ln -sf ~/configs/peripherals/etc/X11/xorg.conf.d/52-tablet.conf /etc/X11/xorg.conf.d/52-tablet.conf
ln -sf ~/configs/peripherals/etc/X11/xorg.conf.d/50-mouse-acceleration.conf /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
ln -sf ~/configs/shell/.bashrc ~/.bashrc
ln -sf ~/configs/shell/.p10k.zsh ~/.p10k.zsh
ln -sf ~/configs/shell/.zshrc ~/.zshrc
