<!-- vim:ft=markdown 
-->

# My Linux configuration

These are my Linux configuration files, currently used across all my Linux
environments:

- Arch Linux on dual-boot
- Arch Linux on Windows Subsystem for Linux
- Termux on Android

## Overview

[1. Terminal](https://github.com/j1nxie/configs#terminal)
[2. Graphical user interface](https://github.com/j1nxie/configs#graphical-user-interface)
[3. Email client](https://github.com/j1nxie/configs#email-client)
[4. Editor](https://github.com/j1nxie/configs#editor)
[5. Shell](https://github.com/j1nxie/configs#shell)

## Terminal

- `kitty`
- Usually used in tandem with `tmux` if I'm working over `ssh`, else it is used
by itself.
- **Configuration:**
  - Color scheme: Solarized Dark
  - Font: Fira Code (latest version, patched with Nerd Fonts)

## Graphical user interface

- `bspwm + polybar`
- **Configuration:**
  - `bspwm:`
    - Compositor: picom
    - Hotkeys daemon: sxhkd
    - Notifications: dunst
  - `polybar:`
    - Mainly taken from [jonhoo](https://github.com/jonhoo/)'s `polybar`
    [config](https://github.com/jonhoo/configs/)
