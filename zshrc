
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="fino"
#ZSH_THEME="takashiyoshida"
#ZSH_THEME="robbyrussell"
#ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" "fino" )

ENABLE_CORRECTION="true"
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

plugins=(
git
docker
colored-man-pages
colorize
z
kubectl
)

source $ZSH/oh-my-zsh.sh

source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
zstyle ':autocomplete:history-search-backward:*' list-lines 32
zstyle ':autocomplete:history-incremental-search-backward:*' list-lines 32
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*' file-list all


#ANTIGEN
source $HOME/antigen.zsh
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting

# Bundles from the default repo (robbyrussell's oh-my-zsh).
#antigen bundle git
#antigen bundle heroku
#antigen bundle pip
#antigen bundle lein

antigen apply
#END_ANTIGEN

# useful alias
alias lr='ls -tr'
alias lra='ls -tra'
alias locate='find . -iname'
alias listenports='sudo lsof -i -P -n | grep LISTEN'
alias now='echo "console.log(Date.now())" | node'
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

