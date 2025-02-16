#
# ~/.profile
#

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

PATH="$HOME/.nix-profile/bin:$PATH"
PATH="$HOME/.ghcup/bin:$PATH"
PATH="$XDG_DATA_HOME/cargo/bin:$PATH"
PATH="$XDG_DATA_HOME/go/bin:$PATH"

export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export ANDROID_USER_HOME="$XDG_DATA_HOME/android"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
# export CARGO_TARGET_DIR="$CARGO_HOME/target"
export GHCUP_USE_XDG_DIRS='1'
export STACK_XDG=1
export GOPATH="$XDG_DATA_HOME/go"

export EDITOR='nvim'
export SUDO_EDITOR='vim'
export PAGER='bat'
export DIFFPROG='nvim -d'

if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
