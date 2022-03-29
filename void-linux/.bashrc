# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Aliases
alias sudo="sudo "
alias wpa="wpa_supplicant -B iwlan0 -c/etc/wpa_supplicant/wpa_supplicant-wlan0.conf"
alias xi="xbps-install"
alias rechrony="xbps-reconfigure -f chrony"
alias hdmi-on="xrandr --output HDMI-1 --on"
alias hdmi-off="xrandr --output HDMI-1 --off"

# Exports
export DISPLAY=":0.0"

unclutter -idle 10 &
