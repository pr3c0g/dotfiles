# Profile start up time on demand

#export ZPROF="true"

[ -z "$ZPROF" ] || zmodload zsh/zprof

ZSH_AUTOSUGGST_USE_ASYNC="true"
fpath+=~/.zfunc

# Store begginning timestamp and duration
setopt EXTENDED_HISTORY

### pre-antigen bundles sources
# source ~/.config/zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
###

### auto-completions
# https://gist.github.com/ctechols/ca1035271ad134841284
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

### antigen
source /usr/local/share/antigen/antigen.zsh

# Add Oh-My-ZSH as an API for plugins and theme
antigen use oh-my-zsh 

antigen bundles <<EOBUNDLES
mroth/evalcache
command-not-found
colored-man-pages
extract
git
unixorn/fzf-zsh-plugin@main
wfxr/forgit
zsh-users/zsh-completions
zsh-users/zsh-autosuggestions
zsh-users/zsh-syntax-highlighting

EOBUNDLES

antigen apply
###


### sources 
source ~/.config/zsh/functions.sh
source ~/.config/zsh/aliases.sh
source ~/.config/zsh/exports.sh
source ~/.local/share/lscolors.sh
###

### inits
_evalcache rbenv init -
_evalcache starship init zsh
_evalcache zoxide init zsh
_evalcache brew shellenv
_evalcache uv generate-shell-completion zsh
_evalcache uvx --generate-shell-completion zsh
###

autoload -Uz edit-command-line
zle -N edit-command-line

function kitty_scrollback_edit_command_line() { 
  local VISUAL='/Users/pr3c0g/.local/share/nvim/lazy/kitty-scrollback.nvim/scripts/edit_command_line.sh'
  zle edit-command-line
  zle kill-whole-line
}

zle -N kitty_scrollback_edit_command_line

bindkey '^x^e' kitty_scrollback_edit_command_line

### slow AF
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Profile start up time on demand
[ -z "$ZPROF" ] || zprof

source /Users/pr3c0g/Library/Application\ Support/org.dystroy.broot/launcher/bash/br
# eval "$(uv generate-shell-completion zsh)"
