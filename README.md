# dotfiles

## Table of Contents

- [dotfiles](#dotfiles)
  - [Table of Contents](#table-of-contents)
  - [Installation](#installation)
  - [Manual Steps](#manual-steps)
      - [Gnome extensions](#gnome-extensions)
      - [DisplayLink](#displaylink)
      - [Install the SSH keys](#install-the-ssh-keys)
      - [Copy configurations](#copy-configurations)

## Installation

1. Download the repo and Run the setup script as root

```bash
$ git clone git@github.com:mauhftw/dotfiles
$ cd dotfiles/
$ ./setup
```
2. Then follow the [Manual Steps](#manual-steps) below to complete the installation.

## Manual Steps

#### Gnome extensions
* https://extensions.gnome.org/extension/946/panel-world-clock-lite/
* https://extensions.gnome.org/extension/6952/rezmon/
* https://extensions.gnome.org/extension/1634/resource-monitor/

#### DisplayLink
* https://github.com/AdnanHodzic/displaylink-debian

#### Install the SSH keys
Copy the target SSH ketys to the `~/.ssh` directory

#### Copy configurations
```bash
$ cp -r config/* ~/.
```
