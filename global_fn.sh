#!/usr/bin/env bash

set -e

# Directories
scrDir="$(dirname "$(realpath "$0")")"
confDir="${XDG_CONFIG_HOME:-$HOME/.config}"

# Functions
pkg_installed() {
    local pkg=$1
    if pacman -Q "$pkg" &>/dev/null; then
        return 0
    elif [ -n "${aurhlpr}" ] && ${aurhlpr} -Q "$pkg" &>/dev/null; then
        return 0
    else
        return 1
    fi
}

pkg_available() {
    local pkg=$1
    if pacman -Si "$pkg" &>/dev/null; then
        return 0
    elif [ -n "${aurhlpr}" ] && ${aurhlpr} -Si "$pkg" &>/dev/null; then
        return 0
    else
        return 1
    fi
}

aur_available() {
    local pkg=$1
    if [ -n "${aurhlpr}" ]; then
        if ${aurhlpr} -Si "$pkg" &>/dev/null; then
            return 0
        fi
    fi
    return 1
}

service_running() {
    local service=$1
    if systemctl --user is-active "$service" &>/dev/null; then
        return 0
    else
        return 1
    fi
}

service_enable() {
    local service=$1
    if ! systemctl --user is-enabled "$service" &>/dev/null; then
        systemctl --user enable "$service"
    fi
    if ! service_running "$service"; then
        systemctl --user start "$service"
    fi
}

prompt_timer() {
    set +e
    unset PROMPT_INPUT
    local timsec=$1
    local msg=$2
    while [[ ${timsec} -ge 0 ]]; do
        echo -ne "\r :: ${msg} (${timsec}s) : "
        read -rt 1 -n 1 PROMPT_INPUT && break
        ((timsec--))
    done
    export PROMPT_INPUT
    echo ""
    set -e
}
print_log() {
    local executable="${0##*/}"
    local logFile="${cacheDir}/logs/${HYDE_LOG}/${executable}"
    mkdir -p "$(dirname "${logFile}")"
    local section=${log_section:-}
    {
        [ -n "${section}" ] && echo -ne "\e[32m[$section] \e[0m"
        while (("$#")); do
            case "$1" in
            -r | +r)
                echo -ne "\e[31m$2\e[0m"
                shift 2
                ;; # Red
            -g | +g)
                echo -ne "\e[32m$2\e[0m"
                shift 2
                ;; # Green
            -y | +y)
                echo -ne "\e[33m$2\e[0m"
                shift 2
                ;; # Yellow
            -b | +b)
                echo -ne "\e[34m$2\e[0m"
                shift 2
                ;; # Blue
            -m | +m)
                echo -ne "\e[35m$2\e[0m"
                shift 2
                ;; # Magenta
            -c | +c)
                echo -ne "\e[36m$2\e[0m"
                shift 2
                ;; # Cyan
            -wt | +w)
                echo -ne "\e[37m$2\e[0m"
                shift 2
                ;; # White
            -n | +n)
                echo -ne "\e[96m$2\e[0m"
                shift 2
                ;; # Neon
            -stat)
                echo -ne "\e[30;46m $2 \e[0m :: "
                shift 2
                ;; # status
            -crit)
                echo -ne "\e[97;41m $2 \e[0m :: "
                shift 2
                ;; # critical
            -warn)
                echo -ne "WARNING :: \e[97;43m $2 \e[0m :: "
                shift 2
                ;; # warning
            +)
                echo -ne "\e[38;5;$2m$3\e[0m"
                shift 3
                ;; # Set color manually
            -sec)
                echo -ne "\e[32m[$2] \e[0m"
                shift 2
                ;; # section use for logs
            -err)
                echo -ne "ERROR :: \e[4;31m$2 \e[0m"
                shift 2
                ;; #error
            *)
                echo -ne "$1"
                shift
                ;;
            esac
        done
        echo ""
    } | if [ -n "${HYDE_LOG}" ]; then
        tee >(sed 's/\x1b\[[0-9;]*m//g' >>"${logFile}")
    else
        cat
    fi
}
