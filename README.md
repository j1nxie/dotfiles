# My Linux configurations

These are my Linux configuration files, used across all of my Linux environments:

- Main PC:
  - Windows Subsystem for Linux (running Arch Linux)
  - Arch Linux (dualbooting on another drive)
- Phone: Android running Termux  

The main purpose of this repository is for quick and easy synchronization between
my platforms, hence the inclusion of files such as
`.gitconfig` and Xorg `.conf` files.

## 1. Overview

- My current installation includes:
  - Editor: Neovim
  - Window manager: bspwm + polybar (taskbar) + sxhkd (hotkeys) + dunst (notifications)
  - Terminal: kitty
  - Fonts: Fira Code + Nerd Fonts
  - Shell: zsh + powerlevel10k
  - Colorscheme: Solarized Dark

- This repository also includes two Xorg `.conf` files, which configures my tablet
(XP-PEN STAR G640) to work under Wacom drivers, and my mouse
to have acceleration disabled. These files are removable, and should not affect
your installation in any unrecoverable way, if installed.
- This also includes a `.gitconfig` file, which will **overwrite**
your global Git config! Make sure to backup this file as well as all your old configurations.

## 2. Installation

**NOTE: ALWAYS CLONE THIS TO YOUR HOME DIRECTORY! THIS WILL REMOVE YOUR CURRENT
CONFIGURATIONS. THIS PROCESS IS NOT RECOVERABLE.**

- I have included a shell script (symlink.sh) to quickly make the directories and
symlink these config files for you. This script should be ran under `sudo`,
since the script includes two Xorg .conf files for my peripherals,
which will be symlinked to `/etc/X11/xorg.conf.d/`.

**Step 1:** Clone this repository:
`git clone https://github.com/j1nxie/configs`  
**Step 2:** Change directory into the cloned folder: `cd configs`  
**Step 3:** Execute the shell script: `./symlink.sh`  

You should be done here already. Take note that your old configuration files
will not be backed up automatically, but removed.
Make sure to back them up if you're only looking to try out these configurations.
