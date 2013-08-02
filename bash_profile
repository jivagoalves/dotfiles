# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH

# Use Vim as default editor
export EDITOR=vim

source ~/.bash/aliases
source ~/.bash/completions

# Add colors,
# make prompt below line status to save space
# and add current git repo branch
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00;33m\]\[\033[00m\]\[\033[0;33m\]$(__git_ps1 " (%s)")\[\033[00m\]\n\$ '

# Show current Git repo status on command line
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
