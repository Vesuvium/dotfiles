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
alias lh="ls -lh"
alias blast="python setup.py install > /dev/null 2>&1; pytest -q"
alias update='apt-get update'
alias upgrade='apt-get upgrade'
alias distupgrade='apt-get dist-upgrade'
alias nv='nvim'
alias ac='activate'
alias logline="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"


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

function c() {
    # cd for project directories
    if [ ! -z $1 ]; then
        if [ -d ~/dev/$1 ]; then
            cd ~/dev/$1
            if [ -d $1 ]; then
                cd $1
            fi
        fi
    fi
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

function dotfiles(){
    # Installs dotfiles or updates them
    cp bashrc ~/.bashrc
    mkdir -p ~/.oh-my-zsh/themes
    cp zshrc ~/.zshrc
    cp zsh-themes/hyperzsh.zsh-theme ~/.oh-my-zsh/themes/hyperzsh.zsh-theme
    cp vimrc ~/.vimrc
    cp nanorc ~/.nanorc
    mkdir -p ~/.config/nvim
    cp -r nvim/* ~/.config/nvim/
    cp tmux.conf ~/.tmux.conf
}

function m() {
    # shorthand for git commit -m
    git commit -m $1
}

# Python virtualenv
function makenv() {
    virtualenv --python=python$2 $1
}

function pep8 () {
    # shorthand for pep-8
    if [ ! -z $1 ]; then
        tox -e pep8 | grep -i $1
    else
        tox -e pep8
    fi
}

function scaffold() {
    # creates the initial files for a project
    # usage: scaffold project_type [path]
    if [ $1 = "python" ]; then
        mkdir -p tests/unit
        touch tests/unit/__init__.py
        touch README.md
        touch .travis.yml
        touch .codacy.yml
        wget -q https://raw.githubusercontent.com/Vesuvium/dotfiles/master/python/tox.ini
        wget -q https://raw.githubusercontent.com/Vesuvium/dotfiles/master/python/pytest.ini
        wget -q https://raw.githubusercontent.com/Vesuvium/dotfiles/master/python/setup.py
        wget -O .gitignore -q https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore
        if [ ! -z $2 ]; then
            mkdir $2
            touch $2/__init__.py
        fi
    elif [ $1 = "node" ]; then
        if [ ! -z $2 ]; then
            mkdir $2
            cd $2
        fi
        npm init
        touch README.md
        touch .codacy.yml
        wget -O .gitignore https://raw.githubusercontent.com/github/gitignore/master/Node.gitignore
    elif [ $1 = "vue" ]; then
        if [ ! -z $2 ]; then
            scaffold node $2
        else
            scaffold node
        fi
        mkdir js sass images
        touch Makefile
        touch rollup.config.js
        npm i --save axios cockatrice foundation-sites vue vue-router webfontloader
        npm i --save-dev rollup rollup-plugin-analyzer rollup-plugin-buble rollup-plugin-node-resolve rollup-plugin-vue
        npm i --save-dev sass-lint uglify-js vue-template-compiler vue-test-utils
    elif [ $1 = "elixir" ]; then
        if [ ! -z $2 ]; then
            mix new $2
        fi
        touch .codacy.yml
    fi
}

function serve() {
    if [ -z $1 ]; then
      port=1692
    else
      port=$1
    fi
    python3 -m http.server $port
}

# Find what installed a command
function what() {
  which "$@" | xargs -r readlink -f | xargs -r dpkg -S
}
