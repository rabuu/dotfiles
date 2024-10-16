#
# ~/.bash_profile
#

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$XDG_CONFIG_HOME/emacs/bin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"
export PATH="$HOME/.cabal/bin:$PATH"

export EDITOR='nvim'
export PAGER='bat'
export DIFFPROG='nvim -d'

export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export ANDROID_USER_HOME="$XDG_DATA_HOME/android"

export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export CARGO_TARGET_DIR="$XDG_DATA_HOME/cargo/target"

export BAT_THEME='base16'

[[ -f ~/.bashrc ]] && . ~/.bashrc
