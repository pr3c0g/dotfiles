zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM="xterm-256color"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/pr3c0g/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# ZSH_THEME="powerlevel9k"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
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
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd" # or set a custom format using the strftime function format specifications, # see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(fzf fzf-tab zsh-autosuggestions colored-man-pages)
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# My custom stuff
PATH=$PATH:~/bin
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH" # adding gnu utils with normal names instead of ggrep gsed and so on.
PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
PATH="/Applications/kitty.app/Contents/MacOS/:$PATH"
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="/Users/pr3c0g/.cargo/bin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export java_home=~/bin/java/Contents/Home
export JAVA_HOME=~/bin/java/Contents/Home
export EDITOR=$(which lvim)

POWERLINE9K_MODE="nerdfont-complete" 

alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias ss64='ss64.sh'
alias rssh='rssh.sh'
alias cdc='cd ~/R3/2_CDC/git/cdc'
alias cdbolt='cd ~/R3/2_CDC/git/gitlab/bolt'
alias cdnb='cd ~/R3/2_CDC/git/nbsoc'
alias sockseu='printf "\nWearing european socks ..."; ssh -D 9876 ptlisjmp00-01'
alias socksam='printf "\nWearing american socks ..."; ssh -D 9875 usmifjmp00-01'
alias tunnels='python3 ~/bin/tunnels.py'
alias phelper='python3 ~/bin/phelper.py ~/bin/phelper.cfg'
alias cddev='cd ~/dev_space'
alias vim='lvim'
alias ls='ls --color=always'
alias love='/Applications/love.app/Contents/MacOS/love'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Created by `userpath` on 2020-02-08 11:38:24
export PATH="$PATH:/Users/pr3c0g/.local/bin"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Kitty autocompletion
autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

##### Custom functions #####
GitPull() {
  find . -type d -name '.git' -print0 \
    |xargs -0 -I % /bin/bash -c 'echo "Working on %.."; cd %; cd ..; git pull'
}

CGitPull() {
  find ~/R3/2_CDC/git -type d -name '.git' -print0 \
    |xargs -0 -I % /bin/bash -c 'echo "Working on %.."; cd %; cd ..; git pull --rebase' 
}

validate_erb() {
  erb -P -x -T '-' $1 | ruby -c
}

#########################

PATH="$PATH:/Users/pr3c0g/R3/git/puppet-editor-services"

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# pyenv virtualenv plugin
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
