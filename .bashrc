# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
PATH="$HOME/Documents/scripts/bash:$PATH"
export PATH

# LS Coloring
LS_COLORS="$LS_COLORS:di=01;34:"  # directories
LS_COLORS="$LS_COLORS:ln=01;36:"  # symbolic links
LS_COLORS="$LS_COLORS:ex=01;32:"  # executables
LS_COLORS="$LS_COLORS:fi=00;30:"  # files


# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
