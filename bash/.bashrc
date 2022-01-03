#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='\u \W \$ '

# Paths
PATH="$PATH:/home/sheung/.local/bin"
PATH="$PATH:/home/sheung/bin"

# ENV Vars
EDITOR="nvim"
TERMINAL="alacritty"
export EDITOR
export TERMINAL

NNN_FCOLORS='c1e21d6b83b218f7c6d6abb4'
export NNN_FCOLORS

# Aliases
alias bl="sudo xbacklight"
alias vol="amixer sset Master"

# Powerline-Shell
function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

