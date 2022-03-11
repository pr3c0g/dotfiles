ZSH_AUTOSUGGEST_USE_ASYNC="true"
# Add Antigen
source /usr/local/share/antigen/antigen.zsh
# Add Oh-My-ZSH as an API for plugins and theme
antigen use oh-my-zsh 

antigen bundles <<EOBUNDLES
command-not-found
colored-man-pages
extract
git
fzf
Aloxaf/fzf-tab

zsh-users/zsh-completions
zsh-users/zsh-autosuggestions
zsh-users/zsh-syntax-highlighting

EOBUNDLES

antigen apply

# Completion for kitty
autoload -Uz compinit
compinit
kitty + complete setup zsh | source /dev/stdin

# sources 
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/exports.zsh
source ~/.config/zsh/functions.zsh
source ~/.local/share/lscolors.sh
# source ~/.config/lvim/nvr_completion.bash  # autocomplete for nvim-remote

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# pyenv virtualenv plugin
# Disabled because it's really slow (100ms)
# if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

eval "$(starship init zsh)"
