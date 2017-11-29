# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/jacopo/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Aliases for commands
alias g="grep"
alias h="history"
alias gh="history | grep"
alias lh="ls -lh"
alias blast="python setup.py install > /dev/null 2>&1; pytest -q"
alias update='apt-get update'
alias upgrade='apt-get upgrade'
alias distupgrade='apt-get dist-upgrade'
alias zshconfig="nvim ~/.zshrc"


# Displays a welcome message!
if [ -x "$(command -v figlet)" ]; then
    figlet "Welcome, " $USER;
    echo "";
fi

# Custom functions
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

function dotfiles(){
    # Installs dotfiles or updates them
    cp bashrc ~/.bashrc
    cp zshrc ~/.zshrc
    cp vimrc ~/.vimrc
    cp -r nvim/* ~/.config/nvim/
    cp tmux.conf ~/.tmux.conf
}

function m() {
    # shorthand for git commit -m
    git commit -m $1
}

function makenv() {
    # shorthand for creating virtual environments
    virtualenv --python=python$2 $1
}

function scaffold() {
    # creates the initial files for a project
    # supports various languages
    if [ $1 = "python" ]; then
        mkdir tests
        mkdir tests/unit
        touch README.rst
        touch pytest.ini
        touch .travis.yml
        touch .codeclimate.yml
        wget -q https://raw.githubusercontent.com/Vesuvium/dotfiles/master/python/tox.ini
        wget -q https://raw.githubusercontent.com/Vesuvium/dotfiles/master/python/setup.py
        wget -O .gitignore -q https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore
        if [ ! -z $2 ]; then
            mkdir $2
            touch $2/__init__.py
        fi
    elif [ $1 = "javascript" ]; then
        npm init
        touch Gruntfile.json
        touch README.md
        wget -O .gitignore https://raw.githubusercontent.com/github/gitignore/master/Node.gitignore
    elif [ $1 = "elixir" ]; then
        if [ ! -z $2 ]; then
            mix new $2
        fi
        touch .travis.yml
    fi
}



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
