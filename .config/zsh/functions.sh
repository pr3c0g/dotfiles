#!/usr/bin/env bash

#shellcheck source=/Users/pr3c0g/.config/zsh/common.sh
source ~/.config/zsh/common.sh

# Check all git repos on folder specified by arg 1 defaults to current folder
# then do a git pull rebasing and recursing submodules
gitPull() {
    dir="${1:=.}"
    find "$dir" -type d -name '.git' -print0 |
        xargs -0 -I % /bin/bash -c 'echo "Working on %.."; cd %; cd ..; git pull --rebase --recurse-submodules'
}

cGitPull() {
    local cdc_repos="$HOME/R3/2_CDC/git"
    gitPull "$cdc_repos"
}

sshadd() {
    local OPTIND # https://mywiki.wooledge.org/BashFAQ/035#getopts
    local lib verbose=0
    local -a lib_options
    local -a libs=("/usr/local/lib/opensc-pkcs11.so" "/usr/local/lib/libcardos11.dylib")

    print_help() {
        print_info "-v     verbose\n"
        print_info "-h     verbose\n"
    }

    while getopts hv opt; do
        case $opt in
        v) verbose=$((verbose + 1)) ;;
        h) print_help ;;
        *) : ;;
        esac
    done

    shift "$((OPTIND - 1))"

    # filter out non existent libs
    for lib in "${libs[@]}"; do
        [[ -f $lib ]] && lib_options+=("$lib")
    done

    # use the pkcs11 lib passed as arg1 or choose from hardcoded list
    (($# == 0)) &&
        lib=$(gum choose "${lib_options[@]}") ||
        lib="$1"

    if [[ ! -f $lib ]]; then
        print_error "Can't find ${lib}\n"
        print_warning "More info:\n"
        file "$lib"
        stat "$lib"
        return 1
    fi

    print_info "Using lib: "
    printf "%s\n" "$lib"
    if count=$(ssh-add -l | wc -l); then
        print_warning "SSH Agent already running!\n"
        print_info "Removing"
        print_warning " $count "
        print_info "keys from chosen pkcs11 provider before adding:\n"
        ssh-add -e "$lib"
        print_info "Done, listing:\n"
        ssh-add -l
    fi

    print_info "Adding PKI keys with pkcs11:\n"
    ssh-add -s "$lib"

    print_info "Done, listing:\n"
    ssh-add -l
}

socks() {
    local profile="$1" socks_port="$2" jumpbox="$3"
    local log_file="/Users/pr3c0g/R3/2_CDC/logs_and_dumps/firefox_socks${profile}.out"

    if ! pgrep -fi "[f]irefox -P ${profile}"; then

        tput setaf 4 && tput bold
        printf "Starting Firefox %s\n" "$1"
        tput sgr0

        touch "$log_file"
        nohup /Applications/Firefox.app/Contents/MacOS/firefox -P "$profile" \
            &>"$log_file" &
        pid=$!
        tput dim && printf "Log file at %s\n" "$log_file" && tput sgr0
    else
        print_warning "Firefox with profile ${profile} already running, skipping\n"
    fi

    if ! nc -zv localhost "$socks_port" &>/dev/null; then

        tput setaf 4 && tput bold
        printf "Starting SOCKS proxy tunnel on %s\n" "$jumpbox"
        tput sgr0

        ssh -N -D "$socks_port" "$jumpbox" &
    else
        print_warning "Port ${socks_port} already in use, skipping\n"
    fi
    gum spin --spinner pulse --title "Waiting 3 seconds for Firefox to warm up, network monitoring will then start" -- sleep 3
    # iDRAC virtual media transfer monitoring
    # [[ -n "$pid" ]] && nettop -nPc -p "$pid" -s 5 -J bytes_in,bytes_out
}

secure_input_find_process() {
    ioreg -l -w 0 |
        perl -nle 'print $1 if /"kCGSSessionSecureInputPID"=(\d+)/' |
        uniq |
        xargs -I{} ps -p {} -o comm=
}

git_report() {
    since="${1:-2 weeks ago}"
    until="${2:-today}"
    commit_pattern="${3:-TRAP}"

    while read -r repo; do
        pushd "${repo}/.." &>/dev/null || return 1
        read -r repo_name \
            < <(basename -s .git "$(git config --get remote.origin.url)")

        tput setaf 4 && tput bold
        printf " -> %-55s   (cloned @ %s)\n" "$repo_name" "$repo"
        tput sgr0

        git \
            --no-pager log \
            --author="ricardo.rebelo" \
            --since="$since" \
            --until="$until" \
            --grep="$commit_pattern" \
            --format=tformat:'%Cgreen%h%Creset | %ad | %s' \
            --date=format:'%d-%m-%Y %H:%M'

        popd &>/dev/null || return 1
    done < <(find . -name ".git" -type d)
}

jira_host_open_tickets() {
    local host=${1:?host at arg1}
    open "https://cdc.sc.siemens.com/secure/jira/issues/?jql=(cf%5B11400%5D%20%3D%20${host}%20OR%20cf%5B11109%5D%20%3D%20${host})%20AND%20status%20!%3D%20closed"
}

xymon_goto_output() {
    local host=${1:?host at arg1}
    local service=${2:?service at arg2}
    open "https://cdc.siemens.com/secure/monitor2/xymon2-cgi/svcstatus.sh?HOST=${host}&SERVICE=${service}"
}

# FIXME: "${@: -1}" assumes destination host as last arg
ssh_repeater() {
    local down=0
    local count=0
    local start_time=$SECONDS

    # show ssh help when no args are passed
    [[ $# == 0 ]] && ssh

    while :; do
        ssh "$@"
        print_error "$(date '+%F %T'): Connection lost!\n"
        tput sc
        until ssh -q "${@: -1}" exit; do
            tput rc && tput ed
            print_warning "$(date '+%F %T'): Attempt $count to reconnect failed...\n"
            ((count++))
        done
        down=$((SECONDS - start_time))
        print_soft_success "$(date '+%F %T'): Connection restored after "
        print_soft_success "$((down / 3600))h:$((down % 3600 / 60))m:$((down % 60))s\n"
    done
}

sourcegraph() {
    local host=usirvcid06-01

    if ! pgrep -f "ssh -NL 7080:127.0.0.1:7080 $host"; then
        print_info "Tunnelling to sourcegraph at ${host}:7080...\n"
        ssh -NL 7080:127.0.0.1:7080 "$host" >/dev/null &

    else
        print_info "Tunnel to sourcegraph already running...\n"
    fi
    until curl -s localhost:7080 >/dev/null; do
        gum spin --spinner pulse --title "Waiting for Sourcegraph UI to be reachable" -- sleep 1
    done
    print_info "Ready! Opening sourcegraph.\n"
    open http://localhost:7080/search
}

ss64() {
    local identifier

    tput sc
    print_warning 'Input encryption key: '
    read -s -r key
    tput rc && tput el

    if (($# > 0)); then
        identifier="$1"
    else
        print_warning 'Input identifier string: '
        read -r identifier
        tput rc && tput el
    fi

    printf "%s:%s" "$key" "$identifier" |
        shasum -a 256 |
        perl -ne 's/([0-9a-f]{2})/print chr hex $1/gie' |
        base64 |
        tr +/ Ea |
        cut -b 1-20 |
        tr -d '\n' |
        pbcopy

    print_success 'Check your clipboard\n'
}

get_pass() {
    tput sc
    local choice pass

    choice="$(
        security dump-keychain CDC.keychain |
            grep -oP '0x00000007 <blob>="\K.*(?=")' |
            gum filter
    )"

    print_warning "Fetching password for ${choice}...\n"
    pass=$(security find-generic-password -w -l "$choice")

    tput rc && tput el
    [[ -z $pass ]] &&
        print_error "Can't find ${choice}!\n" &&
        return 1

    printf "%s" "$pass" | pbcopy # to ensure no newline goes to clipboard
    print_success 'Check your clipboard\n'
}

y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
