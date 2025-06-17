if status is-interactive
    set fish_greeting
    set fish_autosuggestion_enabled 0

    alias cp 'cp --interactive --verbose'
    alias mv 'mv --interactive --verbose'
    alias rm 'rm --interactive=once --verbose'
    alias rmdir 'rmdir --verbose'
    alias mkdir 'mkdir --parents --verbose'
    alias ip 'ip --color'

    alias eza 'eza --group-directories-first'
    alias ls eza

    abbr la 'ls -la'
    abbr l 'ls -1a'
    abbr ll 'ls -la'
    alias lt 'eza -T --git-ignore'

    alias dots '/usr/bin/git --git-dir="$XDG_DATA_HOME/dotfiles" --work-tree="$HOME"'

    alias abandon='disown && exit'
    abbr ab abandon

    abbr zat zathura
    abbr ok okular

    abbr nixdev 'nix develop --command fish'

    abbr venv 'source .venv/bin/activate.fish'

    zoxide init fish | source
    starship init fish | source
end
