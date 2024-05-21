#!/usr/bin/env zsh

# Set up zinit
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "$ZINIT_HOME/zinit.zsh"

# basic plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions

# more snippets
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# completions
autoload -U compinit && compinit
setopt no_beep extended_glob glob_dots aliases correct complete_in_word
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

zinit cdreplay -q

# prompt: starship
eval "$(starship init zsh)"

### mappings

# keybindings: emacs
bindkey -e

# search keys
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^r' history-incremental-search-backward

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

# history
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/zhistory"
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_reduce_blanks

# settings
setopt interactive_comments
setopt rm_star_silent

# cursor shape and terminal title
cursor_beam='\e[5 q'
function precmd {
	print -Pn "\e]0;%~\a"
}
function preexec {
	print -Pn "\e]0;$1\a"
	echo -ne "$cursor_beam"
}
function zle-line-init {
	echo -ne "$cursor_beam"
}
zle -N zle-line-init

# aliases
source "${XDG_CONFIG_HOME:-$HOME/.config}/aliases"

# fzf
zinit light Aloxaf/fzf-tab
zstyle ":completion:*" menu no
zstyle ":fzf-tab:complete:cd:*" fzf-preview 'ls --color $realpath'
zstyle ":fzf-tab:complete:__zoxide_z" fzf-preview 'ls --color $realpath'
eval "$(fzf --zsh)"

# zoxide
eval "$(zoxide init zsh)"
