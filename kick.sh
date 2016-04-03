#!/usr/bin/env bash

[[ $UID == 0 ]] || { printf "%s\n" "run as root"; exit 1; }
source helper/configuration

printf "\n"
for m in "$@"; do
    printf "$BOLD$COLOR_GREEN> running %s$RESET\n\n" "$m"
    source "$m"
    printf "\n"
done
