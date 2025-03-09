#!/usr/bin/zsh
#
## I'd like to know what the hell you did, thank you
alias chmod='chmod -v'
alias chown='chown -v'

# Builtin modifiers
alias ls='ls --color'

# Overrides / concealers
alias vim=nvim

# Functions/commands aliases
alias tunnels='python3 ~/bin/tunnels.py'
alias socksde='socks DE 9874 jumpde'
alias socksam='socks AM 9875 jumpam'
alias sockspt='socks PT 9876 jumppt'
alias rssh='ssh_repeater'
alias fssh='~/bin/fssh.sh'

# Keychain shortcuts
alias getvaultshard='security find-generic-password -l "CDC Vault Unseal Key" -w | base64 --decode | gpg -dq | pbcopy'
alias getpsafepw='security find-generic-password -l "cdc_psafe" -w | tr -d "\n"| pbcopy'
alias getsourcegraphpw='security find-generic-password -l "sourcegraph" -w | tr -d "\n"| pbcopy'
alias getipapw='security find-generic-password -l "ipa" -w | tr -d "\n"| pbcopy'
alias getcasocvcenter='security find-generic-password -l "casocvcenter" -w|tr -d "\n"|pbcopy'

# Git shortcuts
alias sprint_report='git_report "2 weeks ago" "today" "TRAP"'
alias cots_report='git_report "1 week ago" "today" "COTS"'

# kitty stuff
# for showing puppet dependency cycles and stuff like that, just pipe contentes of dot file to this alias:
# Ex: 'cat cycles.dot | idot'
alias idot="dot -Gmargin=0.7 '-Gbgcolor=#ffffff00' -Gcolor=white -Gfontcolor=white -Ncolor=white -Nfontcolor=white -Ecolor=white -T png | kitty +kitten icat --align left"

