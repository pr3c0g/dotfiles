#!/usr/bin/zsh
#
EDITOR="/Users/pr3c0g/bin/nvim"
export EDITOR

# REPL customization
export PYTHONSTARTUP="/Users/pr3c0g/.pythonrc"

# Adding bins to PATH
PATH="$PATH:$HOME/bin"
PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/go/bin"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# Not sure about these
#PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
#PATH="/Applications/kitty.app/Contents/MacOS/:$PATH"
#PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
#MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

export java_home=~/bin/java/Contents/Home
export JAVA_HOME=~/bin/java/Contents/Home

### Other misc ###
export BAT_THEME="Catppuccin-mocha"

# /usr/local/bin/tz (https://github.com/oz/tz) default timezones
export TZ_LIST="America/Chicago,Chicago;America/New_York,Milford;America/Moncton,New Brunswick (CASOC);UTC;Local;Europe/Madrid;Europe/Berlin"
##################

