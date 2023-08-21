# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=100000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/andy/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export EDITOR=nvim

#export PATH=$PATH:/opt/rocm/bin/:$HOME/Documents/applications/bin

#development bin
export PATH=$PATH:$HOME/bin

export PATH=$PATH:$HOME/Documents/applications/bin

export PATH=$PATH:$HOME/.local/bin

# from mac
PS1='%(?.%F{green}%?%f.%F{red}%?%f) %2~ %# '
RPROMPT='%D{%l%M.%S}'
# %a %y %U 
# %n@%M 

# notify alias
alias -g nt='&& notify-send command succeeded || notify-send command failed'

eval "$(zoxide init zsh)"

GPG_TTY=$(tty)
export GPG_TTY

alias x="env -u WAYLAND_DISPLAY"

alias ls="ls -F -b -T 0 -A --color=auto"

# how it took me 6 months to figure this out idk
export GTK_THEME=Adwaita:dark
