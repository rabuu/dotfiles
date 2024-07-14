#!/bin/sh

# xdg variables
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# add scripts to the path
export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':' -)"
export PATH="$PATH:$XDG_DATA_HOME/cargo/bin"
export PATH="$PATH:$XDG_CONFIG_HOME/emacs/bin"
. "/home/rabuu/.local/share/cargo/env"

# default programs
xdg-settings set default-web-browser firefox.desktop
export EDITOR='nvim'
export MANPAGER='nvim +Man!'
export PAGER='bat'
export READER='zathura'
export TERMINAL='alacritty'
export DIFFPROG='nvim -d'

# variables for home directory clean up
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export GOPATH="$XDG_DATA_HOME/go"
export JULIA_DEPOT_PATH="$XDG_DATA_HOME/julia:$JULIA_DEPOT_PATH"
export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"
export LESSHISTFILE=-
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export TEXMFHOME="$XDG_DATA_HOME/texmf"
export TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var"
export TEXMFCONFIG="$XDG_CONFIG_HOME/texlive/texmf-config"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export GHCUP_USE_XDG_DIRS=1
export CABAL_CONFIG="$XDG_CONFIG_HOME/cabal"
export CABAL_DIR="$XDG_CACHE_HOME/cabal"
export STACK_ROOT="$XDG_DATA_HOME/stack"
export WINEPREFIX="$XDG_DATA_HOME/wine"
export ANDROID_USER_HOME="$XDG_DATA_HOME/android"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"

# telegram
export TDESKTOP_USE_GTK_FILE_DIALOG=1
export DESKTOP_APP_I_KNOW_ABOUT_GTK_INCOMPATIBILITY=1

# java
export _JAVA_AWT_WM_NONREPARENTING=1

# rust/cargo
export CARGO_TARGET_DIR="$XDG_DATA_HOME/cargo/target"
