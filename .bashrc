#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# source aliases
[[ -f ${XDG_CONFIG_HOME:-"$HOME/.config"}/aliases ]] && source "${XDG_CONFIG_HOME:-"$HOME/.config"}/aliases"

# starship prompt
eval "$(starship init bash)"

#define PS2
PS2='> '
. "/home/rb/.local/share/cargo/env"
