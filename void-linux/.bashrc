# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# powerline-shell
function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# nnn settings
NNN_FCOLORS='c1e21d6b83b218f7c6d6abb4'
export NNN_FCOLORS

# Aliases
alias sudo="sudo "
alias wpa="wpa_supplicant -B iwlan0 -c/etc/wpa_supplicant/wpa_supplicant-wlan0.conf"
alias xi="xbps-install"
alias rechrony="xbps-reconfigure -f chrony"
alias hdmi-on="xrandr --output HDMI-1 --on"
alias hdmi-off="xrandr --output HDMI-1 --off"
alias hide-cursor="unclutter -idle 10 &"
alias clock="tty-clock -c"

# Tamzen Aliases
alias font="printf '\e]710;%s\007'"

alias TamzenForPowerline-20=TamzenForPowerline10x20r
alias TamzenForPowerline10x20r='font -misc-tamzenforpowerline-medium-r-normal--20-145-100-100-c-100-iso10646-1'

# Paths
export PATH="$PATH:/home/sheung/.local/bin"

# Exports
export DISPLAY=":0.0"
export EDITOR="nvim"
export TERMINAL="urxvt"

