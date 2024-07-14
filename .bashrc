#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# source aliases
[[ -f "$XDG_CONFIG_HOME/aliases" ]] && source "$XDG_CONFIG_HOME/aliases"

# starship prompt
eval "$(starship init bash)"

#define PS2
PS2='> '
. "/home/rabuu/.local/share/cargo/env"
