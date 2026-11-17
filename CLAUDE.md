# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles repo (bash + tmux + alacritty + vim + starship + karabiner). There is no build, lint, or test tooling; "running" the repo means executing the setup scripts, which install packages and symlink configs into `$HOME`.

## Setup scripts

- `./setup` — Debian/Ubuntu (Gnome) bootstrap. Must run as root (uses `apt-get`, resolves the user via uid 1000 in `/etc/passwd`). Installs system packages and apps (tfenv, awscli, kubectl, helm, minikube, Chrome, etc.) and appends `source ~/dotfiles/config/.custom_bashrc` to the user's `.bashrc`. It does **not** create the config symlinks; those are manual (see README).
- `./setup_mac` — macOS (Apple Silicon, `/opt/homebrew`) bootstrap, idempotent. Installs brew formulae/casks, writes `.bash_profile`/`.bashrc` entries via `add_if_missing`, clones the repo to `~/dotfiles`, and creates the symlinks itself (existing non-symlink files are backed up to `*.backup`). Also switches the login shell to `/bin/bash`.
- Don't run either script casually to test changes: they modify the host system.

## Layout and how configs get used

- `config/` holds the dotfiles; each is symlinked into `$HOME` (e.g. `config/.tmux.conf` → `~/.tmux.conf`, `config/starship.toml` → `~/.config/starship.toml`, `config/karabiner.json` → `~/.config/karabiner/karabiner.json`). Edit files in `config/`, not the symlink targets. When adding a new dotfile, add it to the symlink list in `setup_mac` and the README's symlink section.
- `config/.custom_bashrc` is sourced from `~/.bashrc`; it is the shared place for env vars and aliases. It is currently macOS-oriented (`pbcopy`, `docker`→`podman`, `SHELL=/opt/homebrew/bin/bash`) even though `setup` targets Linux. Note it also appends a kubectl completion line to `~/.bashrc` on every shell start (line 30), which duplicates over time.
- `bin/tmux-statusbar-ping` is referenced by an **absolute path** (`/Users/mauh/dotfiles/bin/...`) from `config/.tmux.conf` (`status-right`). Keep them in sync if the script is moved or the repo path changes.
- tmux theme uses a fixed palette (light blue `#89dceb`, violet `#cba6f7`, text `#bac2de`, dark `#1e1e2e`) documented at the top of `.tmux.conf`; keep new styling consistent with it.

## Manual steps not covered by scripts

SSH keys, Starship prerequisites, Gnome extensions, DisplayLink, and VSCode settings sync are documented in `README.md`.
