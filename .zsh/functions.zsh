#!/bin/bash

# Output prettyfying
color_red="\e[31m"
color_green="\e[32m"
color_yellow="\e[33m"
color_blue="\e[34m"
color_bold="\e[1m"
color_reset="\e[0m"

print_error() {
  printf "${color_red}${color_bold}"
  printf "$1\n"
  printf "${color_reset}"
}
print_warning() {
  printf "${color_yellow}${color_bold}"
  printf "$1\n"
  printf "${color_reset}"
}
print_success() {
  printf "${color_green}${color_bold}"
  printf "$1\n"
  printf "${color_reset}"
}
print_soft_success() {
  printf "${color_green}"
  printf "$1\n"
  printf "${color_reset}"
}
print_info() {
  printf "${color_blue}"
  printf "$1\n"
  printf "${color_reset}"
}

# Check all git repos on folder specified by arg 1 defaults to current folder
# then  do a git pull rebasing and recursing submodules
gitPull() {
  find ${1:=.} -type d -name '.git' -print0 \
    |xargs -0 -I % /bin/bash -c 'echo "Working on %.."; cd %; cd ..; git pull --rebase --recurse-submodules'
}

cGitPull() {
  cdc_repos="$HOME/R3/2_CDC/git"
  gitPull "$cdc_repos"
}

# Codi
# Usage: codi [filetype] [filename]
codi() {
  local syntax="${1:-python}"
  shift
  vim -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi $syntax" "$@"
}

clt() {
  case "$1" in
    e|enable) 
      print_info "Enabling CommandLineTools";
      sudo mv -v "/Library/Developer/clt" "/Library/Developer/CommandLineTools"
      ;;
    d|disable) 
      print_info "Disabling CommandLineTools";
      sudo mv -v "/Library/Developer/CommandLineTools" "/Library/Developer/clt"
      ;;
    c|check)
      if [[ -d "/Library/Developer/clt" ]]; then
        print_success "CLT is disabled."
      else
        print_error "CLT is enabled."
      fi
      ;;
    *) print_warning "Wrong args";;
  esac
}

sshadd() {
  if pgrep -q "ssh-agent"; then
    print_warning ">> Agent already running, killing it.."
    killall -v "ssh-agent"
  fi

  print_info ">> Adding SC keys: <<"
  ssh-add -s /usr/local/lib/opensc-pkcs11.so

  print_info ">> Added keys: <<"
  ssh-add -l
}

