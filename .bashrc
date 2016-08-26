# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Source Google Cloud rc stuff if it exists
[ -r ~/.google_cloud_rc ] && source ~/.google_cloud_rc

# Initialize rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Initialize Docker
eval "$(docker-machine env default)"

# User specific aliases and functions
export SVN_EDITOR="emacs"
export EDITOR="emacs"
export GOPATH="$HOME/go"
export PATH=/usr/local/sbin:/usr/local/bin:$PATH:~/bin:$GOPATH/bin:~/.composer/vendor/bin

# Make sure I can see 💩  in Terminal!
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

#Git bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
export GIT_PS1_SHOWDIRTYSTATE=1

alias slowdown="sudo /sbin/tc qdisc add dev eth0 root netem delay 50ms"
alias speedup="sudo /sbin/tc qdisc del dev eth0 root"
alias checkspeed="sudo /sbin/tc filter show dev eth0"

export GREP_OPTIONS="--color=always"

# Colorful shell prompt with helpful info, including current directory and git info (if you're in a git repo)
export PS1='\n[ \e[0;32m\u@\e[m \e[0;34m\w/\e[m$(__git_ps1 " \e[0;33mᚶ%s\e[m") ]\n\$ '
