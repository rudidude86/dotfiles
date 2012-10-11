# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions
EMACS="/user/local/bin/emacs"
alias emacs="$EMACS"
export SVN_EDITOR="$EMACS"
export EDITOR="$EMACS"

alias memento="sudo /sbin/service memcached restart"
alias removegoblins="sudo /sbin/service memcached restart; sudo /sbin/service gearmand restart; sudo /sbin/service zend-server restart;"
alias updatedb="/usr/local/bin/cbdb-progsite migrate; /usr/local/bin/cbdb-corpsite migrate"
alias syncAdminPanel="/var/www/tres/scripts/syncAdminPanel rrud"
alias svnup="echo 'SVN Updating /var/www/api...'; svn up /var/www/api; echo 'SVN Updating /var/www/classic...'; svn up /var/www/classic; echo 'SVN Updating /var/www/fbr...'; svn up /var/www/fbr; echo 'SVN Updating /var/www/hcr...'; svn up /var/www/hcr; echo 'SVN Updating /var/www/mobile...'; svn up /var/www/mobile; echo 'SVN Updating /var/www/propane...'; svn up /var/www/propane; echo 'SVN Updating /var/www/tres...'; svn up /var/www/tres; echo 'SVN Updating /var/www/workers...'; svn up /var/www/workers"
alias slowdown="sudo /sbin/tc qdisc add dev eth0 root netem delay 50ms"
alias speedup="sudo /sbin/tc qdisc del dev eth0 root"
alias checkspeed="sudo /sbin/tc filter show dev eth0"

alias cbsearch="~/cbsearch.sh"
alias branch="~/branch.sh"

alias svndiffprev="svn diff -r PREV:COMMITTED"
alias svnst="svn st | grep '^[^\?X] '"
alias svnsearch="~/svnsearch.sh"
alias updateallthethings="svnup; syncAdminPanel; updatedb; removegoblins"

alias whatswrong="tail /usr/local/zend/var/log/php.log"

export GREP_OPTIONS="--color=always"

export PS1="\n[ \e[0;32m\u@\h\e[m \e[0;34m\w/\e[m ]\n\$ "

# I go to this 90% of the time, so just start there
cd /var/www/platform/
