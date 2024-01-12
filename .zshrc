#!/bin/zsh

### settings

# history settings
setopt hist_expire_dups_first hist_reduce_blanks

# enable comments
setopt interactive_comments

# colors
autoload -Uz colors && colors

# disable rm * warning
setopt rm_star_silent

### prompt

# starship prompt
eval "$(starship init zsh)"

# define PS2
PS2='> '

### vim mode
bindkey -v
export KEYTIMEOUT=1

# enable incremental history backwards search
bindkey '^R' history-incremental-search-backward

# cursor shapes for vim modes
cursor_block='\e[1 q'
cursor_beam='\e[5 q'
function zle-keymap-select {
	case "$KEYMAP" in
		vicmd) echo -ne "$cursor_block" ;;
		viins|main) echo -ne "$cursor_beam" ;;
	esac
}
zle -N zle-keymap-select

function precmd {
	# set terminal title to current working directory
	print -Pn '\e]0;%~\a'
}

function preexec {
	# set terminal title to current command
	print -Pn "\e]0;$1\a"

	# reset cursor shape
	echo -ne "$cursor_beam"
}

zle-line-init() {
	# reset cursor shape
	echo -ne "$cursor_beam"
}
zle -N zle-line-init


### completion

setopt no_beep extended_glob glob_dots aliases correct complete_in_word

# initialize
autoload -Uz compinit && compinit -d "${XDG_CACHE_HOME:-"$HOME/.cache"}/zcompdump"
zmodload zsh/complist

# case insensitive matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# vim keys in completion menu
zstyle ':completion:*' menu select
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history

### mappings

# bind del key
bindkey '^[[3~' delete-char
bindkey -a '^[[3~' delete-char

# disable <c-s> and <c-q>
stty stop undef
stty start undef

# edit the current command with <c-e>
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

# `cd && clear` with <c-space>
bindkey -s '^ ' '^ucd && clear\n'

# source aliases
[[ -f ${XDG_CONFIG_HOME:-"$HOME/.config"}/aliases ]] && source "${XDG_CONFIG_HOME:-"$HOME/.config"}/aliases"

### plugins

# syntax highlighting
source '/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'

# zoxide
eval "$(zoxide init zsh)"
