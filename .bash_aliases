alias ..="cd .."
alias ll="ls -lhA"
alias @venv="python3 -m venv venv"
alias @act="source venv/bin/activate"
alias @deact="deactivate"
alias @ins="sudo apt-get install"
alias @upd="sudo apt-get update"
alias @upg="sudo apt-get upgrade"

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

alias top="htop"
alias du="ncdu"
alias df="pydf"
alias myip="curl http://ipecho.net/plain; echo"

# sudo apt-get install imagemagick if not already available
# This will resize all of the PNG images in the current directory, only if they are wider than 690px.
alias webify="mogrify -resize 690\> *.png"

alias upload="sftp username@server.com:/path/to/upload/directory

# For starters, there are two basic ways to declare a bash syntax. The first uses the function command and looks something like this:

# Functions syntax
# function_name () {
#    command1
#    command2
# }
# Compress this second form into one line and separate the commands with semicolons. A semicolon must come after the last command too:
# function_name () { command1; command2; }

# This one will create a directory and then immediately move into that directory. 
# mcd test
mcd () { mkdir -p $1; cd $1; }

# This function takes the first argument and calls the appropriate utility program based on the file extension used.
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    return 1
 else
    for n in $@
    do
      if [ -f "$n" ] ; then
          case "${n%,}" in
            *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) 
                         tar xvf "$n"       ;;
            *.lzma)      unlzma ./"$n"      ;;
            *.bz2)       bunzip2 ./"$n"     ;;
            *.rar)       unrar x -ad ./"$n" ;;
            *.gz)        gunzip ./"$n"      ;;
            *.zip)       unzip ./"$n"       ;;
            *.z)         uncompress ./"$n"  ;;
            *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                         7z x ./"$n"        ;;
            *.xz)        unxz ./"$n"        ;;
            *.exe)       cabextract ./"$n"  ;;
            *)
                         echo "extract: '$n' - unknown archive method"
                         return 1
                         ;;
          esac
      else
          echo "'$n' - file does not exist"
          return 1
      fi
    done
fi
}

export PS1="SH \[\033[38;5;14m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;11m\]\h\$"
export LS_COLORS="$LS_COLORS:di=1;33"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa 
