#!/usr/bin/env bash

[[ $UID == 0 ]] || { printf "%s\n" "run as root"; exit 1; }
source helper/functions
source config

[[ -z "$@" ]] && { echo "usage: $0 modules/<module1> modules/<module2> ..."; exit 1; }

printf "\n"
for m in "$@"; do
    printf "$BOLD$COLOR_GREEN> running %s$RESET\n\n" "$m"
    source "$m"
    printf "\n"
done
