#!/bin/bash

# My custom stuff
PATH=$PATH:~/bin
PATH="$PATH:/Users/pr3c0g/.local/bin"
EDITOR=$(which lvim)

# adding gnu utils with normal names instead of ggrep gsed and so on.
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
PATH="/Users/pr3c0g/.cargo/bin:$PATH"

export java_home=~/bin/java/Contents/Home
export JAVA_HOME=~/bin/java/Contents/Home

# Remove virtualenv indicator from pyenv (we use starship instead)
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export EDITOR
