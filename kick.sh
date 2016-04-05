#!/usr/bin/env bash

set -e
export LC_ALL=C

[[ $UID == 0 ]] || { printf "%s\n" "run as root"; exit 1; }
source helper/functions
source config

if [[ -z "$@" ]]; then
    printf "%s\n\n" ":: usage: $0 modules/<module1> modules/<module2> ..."
    printf "%s\n" ":: available modules:"
    find modules -type f | sort
    exit 1
fi

printf "\n"
for m in "$@"; do
    if [[ "$m" != "modules/"* ]]; then
        printf "$BOLD$RED> '%s' not in modules-directory$RESET\n\n" "$m"
    elif [[ ! -f "$m" ]]; then
        printf "$BOLD$RED> '%s' not found$RESET\n\n" "$m"
    else
        printf "$BOLD> running %s$RESET\n\n" "$m"
        source "$m"
        printf "\n"
    fi
done
