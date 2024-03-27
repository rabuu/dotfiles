#!/bin/sh

# add scripts to the path
export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':' -)"
export PATH="$PATH:${XDG_DATA_HOME:-$HOME/.local/share}/cargo/bin"
export PATH="$PATH:${XDG_CONFIG_HOME:-$HOME/.config}/emacs/bin"
. "/home/rabuu/.local/share/cargo/env"

# default programs
xdg-settings set default-web-browser librewolf.desktop
# export BROWSER='librewolf'
export EDITOR='nvim'
export MANPAGER='nvim +Man!'
export PAGER='bat'
export READER='zathura'
export TERMINAL='alacritty'
export DIFFPROG='nvim -d'
export LOCKER='slock'

# xdg variables
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# shell variables
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/zhistory"
export HISTSIZE=5000
export SAVEHIST=5000

# variables for home directory clean up
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export JULIA_DEPOT_PATH="${XDG_DATA_HOME:-$HOME/.local/share}/julia:$JULIA_DEPOT_PATH"
export STARSHIP_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/starship/starship.toml"
export LESSHISTFILE=-
export XAUTHORITY="${XDG_DATA_HOME:-$HOME/.local/share}/X11/Xauthority"
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-"$HOME/.config"}/gtk-2.0/gtkrc-2.0"
export GRADLE_USER_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/gradle"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/npm/npmrc"
export TEXMFHOME="${XDG_DATA_HOME:-$HOME/.local/share}/texmf"
export TEXMFVAR="${XDG_CACHE_HOME:-$HOME/.cache}/texlive/texmf-var"
export TEXMFCONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/texlive/texmf-config"
export RUSTUP_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/rustup"
export GHCUP_USE_XDG_DIRS=1
export CABAL_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/cabal"
export CABAL_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/cabal"
export STACK_ROOT="${XDG_DATA_HOME:-$HOME/.local/share}/stack"

# telegram
export TDESKTOP_USE_GTK_FILE_DIALOG=1
export DESKTOP_APP_I_KNOW_ABOUT_GTK_INCOMPATIBILITY=1

# java
export _JAVA_AWT_WM_NONREPARENTING=1

# rust/cargo
export CARGO_TARGET_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/cargo/target"

# google
export GOOGLE_API_KEY="no"
export GOOGLE_DEFAULT_CLIENT_ID="no"
export GOOGLE_DEFAULT_CLIENT_SECRET="no"

# other variables
export AWT_TOOLKIT='MToolkit wmname LG3D'
export QT_QPA_PLATFORMTHEME='qt5ct'
# export COLORTERM='truecolor'

# keyrings directory
[ -d "${XDG_DATA_HOME:-$HOME/.local/share}/keyrings" ] || mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}/keyrings"
