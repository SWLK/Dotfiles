# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

if [ "${XDG_VTNR}" -eq 1 ]; then
	exec startx -x /home/sheung/.xinitrc
fi
