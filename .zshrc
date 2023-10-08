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

export PATH=$PATH:$HOME/.nix-profile/bin

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

export MOZ_ENABLE_WAYLAND=1

alias of="onefetch --no-color-palette --no-art --no-title --disabled-fields=churn"
alias sws="static-web-server -p 8080 -d ."


# this does not if accessing a git repo thru a symlink
function git-subdir() {
    local root=$(git rev-parse --show-toplevel)
    # get top level folder within git
    echo "${PWD#"$root"}"
}

function jobrog_git_tag() {
    local top=$(git-subdir | tr '/' '\n' | head -2 | tail -1)

    if [ -n "$top" ]; then
        top="-t $top"
    fi

    echo "$top"
}

# jobrog porcelain
# mainly adds git integration
function grog() {
    local root=$(git rev-parse --show-toplevel)
    job -d $root $@
}
function start() {
    grog a $(jobrog_git_tag) $@
}
function stop() {
    grog d $@
}
function todo() {
    grog n $(jobrog_git_tag) -t todo $@
}
function todos() {
    grog s -n -t $(jobrog_git_tag) -t todo -T done $@
}
function did() {
        local rx=$1; shift
        grog tag -fnt todo -T done --rx $rx -a done $*
}
