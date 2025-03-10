ZSH_AUTOSUGGST_USE_ASYNC="true"
fpath+=~/.zfunc

# Store beginning timestamp and duration
setopt EXTENDED_HISTORY

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

source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh

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

