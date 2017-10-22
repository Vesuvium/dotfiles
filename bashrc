# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# History options
HISTCONTROL=ignoreboth
HISTSIZE=100000
HISTFILESIZE=200000
HISTIGNORE="history:h"
shopt -s histappend


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


# Set a fancy prompt
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt


# Set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


# Color support for ls and grep
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi


# Alias definitions
alias h='history'
alias g='grep'
alias gh='history | grep'
alias blast="python setup.py install > /dev/null 2>&1; pytest -q"
alias update='apt-get update'
alias upgrade='apt-get upgrade'
alias distupgrade='apt-get dist-upgrade'


# Enable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# Displays a welcome message!
if [ -x "$(command -v figlet)" ]; then
    figlet "Welcome, " $USER;
    echo "";
fi

function activate() {
    # activates a python projects
    # also moves to that directory
    if [ ! -z $1 ]; then
        c $1
    fi

    if [ -f bin/activate ]; then
        source bin/activate
    elif [ -f ../bin/activate ]; then
        source ../bin/activate
    fi
}

# Decode base64 string
function b64decode (){
    echo $1 | base64 --decode;
    echo;
}

# Encode base64 string
function b64encode(){
    echo -n $1 | base64
    echo;
}

# Clone a git repository
function clone(){
  if [ -z $2 ]; then
    host=github.com
  else
    host=$2
  fi
  git clone git@$host:$1.git
}

# Cleans up the history, removing duplicates
function cleanup(){
  nl ~/.bash_history | sort -k 2  -k 1,1nr| uniq -f 1 | sort -n | cut -f 2 > unduped_history
  mv unduped_history ~/.bash_history
}

# Find what installed a command
function what() {
  which "$@" | xargs -r readlink -f | xargs -r dpkg -S
}

# Python virtualenv
function makenv() {
    virtualenv --python=python$2 $1
}
