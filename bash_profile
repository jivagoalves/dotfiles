# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$HOME/.cabal/bin:$PATH
export PATH

# Tomcat
export CATALINA_HOME=$HOME/opt/apache-tomcat

# Add ~/.links to easily jump to favourites directories
CDPATH=$HOME/.links:$CDPATH

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

# Load RVM function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Load NVM
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh
[[ -s $HOME/.nvm/bash_completion ]] && . $HOME/.nvm/bash_completion

# Make explainshell.com available at command line
function explain {
  # base url with first command already injected
  # $ explain tar
  #   => http://explainshell.com/explain/tar?args=
  url="http://explainshell.com/explain/$1?args="

  # removes $1 (tar) from arguments ($@)
  shift;

  # iterates over remaining args and adds builds the rest of the url
  for i in "$@"; do
    url=$url"$i""+"
  done

  # opens url in browser
    xdg-open $url
}
