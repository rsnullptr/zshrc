
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="fino"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
source $HOME/antigen.zsh
antigen bundle zsh-users/zsh-autosuggestions

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Tell Antigen that you're done.
antigen apply

# useful alias
alias lr='ls -tr'
alias lra='ls -tra'
alias locate='find . -iname'
alias listenports='sudo lsof -i -P -n | grep LISTEN'
# useful alias

# git hacks
alias gitroot='cd $(git rev-parse --show-toplevel)'
alias gitctrlftrue='git config core.autocrlf true'
alias gitignored='git ls-files . --ignored --exclude-standard --others'

function gitsquash {
    echo "Squash from: " $1 "; to: " $2 "; msg: " $3;
    git checkout $2;
    git reset $(git merge-base $1 $2);
    git add -A;
    git commit -m $3;
}

function gitslow {
    git config --add oh-my-zsh.hide-status 0;
    git config --add oh-my-zsh.hide-dirty 1;
}

#git hacks 

# cd to file
function cdf { cd $( dirname "$1"); }

# strange chars from cross OS bash scripts
function fixsh {
    sed -i -e 's/\r$//' $1
}

# some fun ....
fortune | cowsay -f "tux"
