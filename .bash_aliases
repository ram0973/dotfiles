function apt_update_with_cache() 
{ if [ -z "$(find /var/cache/apt/pkgcache.bin -mmin -60)" ]; then sudo apt-get update; fi; }

alias ..="cd .."
alias ll="ls -lhA"
alias @venv="python -m venv venv"
alias @act="source venv/bin/activate"
alias @deact="deactivate"
alias @ai="sudo apt-get install"
alias @au="sudo apt-get update"
alias @ag="sudo apt-get upgrade"
alias @scr="sudo systemctl restart"
alias @scs="sudo systemctl status"
alias @sce="sudo systemctl enable"
alias @scd="sudo systemctl disable"
alias @sct="sudo systemctl stop"
alias @scdr="sudo systemctl daemon-reload"

# https://www.digitalocean.com/community/tutorials/an-introduction-to-useful-bash-aliases-and-functions
# If you want to get rid of an alias, just use the unalias command:
# unalias ll
# You can list all of your configured aliases by passing the alias command without any arguments:
# alias
# To temporarily bypass an alias (say we aliased ls to ls -a), we can type:
# \ls
# This will call the normal command found in our path, without using the aliased version.
# Re-read aliases:
# source ~/.bashrc
# Make ls display in columns and with a file type indicator (end directories with "/", etc) by default:
# alias ls="ls -CF"
# We can also anticipate some typos to make it call the correct command:
# alias sl="ls"
# Let's also make an alias to pipe our output to less for viewing large directory listings with the long format:
# alias lsl="ls -lhFA | less"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# This one will list our disk usage in human-readable units including filesystem type, and print a total at the bottom:
alias df="df -Tha --total"
alias du="du -ach | sort -h"
alias free="free -mt"
alias ps="ps auxf"
# Alias that searches our process for an argument we'll pass:
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
# psg bash
# USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
# 1001      5227  0.0  0.0  26320  3376 pts/0    Ss   16:29   0:00 bash

# -p flag to make any necessary parent directories. We can make this the default:
# -v flag on top of that so we are told of every directory creation, 
# which can help us recognize quickly if we had a typo which caused an accidental directory branch:
alias mkdir="mkdir -pv"

# -c flag in order to continue the download in case of problems.
alias wget="wget -c"

# We can search our history easily like with a grep of the history command's output. 
# This is sometimes more useful than using CTRL-R to reverse search because 
# it gives you the command number to do more complex recalls afterwards:
alias histg="history | grep"

# alias top="htop"
# alias du="ncdu"
# alias df="pydf"
alias myip="curl http://ipecho.net/plain; echo"
alias headers='curl -I'

# sudo apt-get install imagemagick if not already available
# This will resize all of the PNG images in the current directory, only if they are wider than 690px.
alias webify="mogrify -resize 690\> *.png"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias ports='netstat -tulnp'
## replace mac with your actual server mac address #
alias wakeuppc='/usr/bin/wakeonlan 08:60:6E:D5:94:78'

## shortcut  for iptables and pass it via sudo#
alias ipt='sudo /sbin/iptables'
 
# display all rules #
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall=iptlist

alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'