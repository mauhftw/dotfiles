# dotfiles

## Table of Contents

- [dotfiles](#dotfiles)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Manual Steps](#manual-steps)
      - [Starship](#starship)
      - [Gnome extensions](#gnome-extensions)
      - [DisplayLink](#displaylink)
      - [VSCode](#vscode)
      - [Install the SSH keys](#install-the-ssh-keys)
      - [Create a symlink to the configs](#create-a-symlink-to-the-configs)

## Installation

1. Download the repo and Run the setup script as root

```bash
$ git clone git@github.com:mauhftw/dotfiles
$ cd dotfiles/
$ ./setup
```
2. Then follow the [Manual Steps](#manual-steps) below to complete the installation.

## Manual Steps

#### Starship
* https://starship.rs/guide/#prerequisites

#### Gnome extensions
* https://extensions.gnome.org/extension/946/panel-world-clock-lite/
* https://extensions.gnome.org/extension/1634/resource-monitor/
* https://extensions.gnome.org/extension/5446/quick-settings-tweaker/

#### DisplayLink
* https://github.com/AdnanHodzic/displaylink-debian

#### VSCode
* File > Preferences > Backup & Sync

#### Install the SSH keys
Copy the target SSH ketys to the `~/.ssh` directory

#### Create a symlink to the configs
```bash
ln -s $HOME/dotfiles/config/.alacritty.toml $HOME/.alacritty.toml
ln -s $HOME/dotfiles/config/.gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/config/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/config/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/config/starship.toml $HOME/.config/starship.toml 
```
