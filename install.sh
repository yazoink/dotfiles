#!/bin/bash

create_missing_dir() {
    if [[ -z "$1" ]]; then
        mkdir -p "$1"
        if [[ $? != 0 ]]; then
            printf "Installation failed, could not create directory $1. Make sure you have permission to do so.\n"
        fi
    fi
}

stow_dir() {
    stow "$1" -t ~
    if [[ $? != 0 ]]; then
        printf "Installation failed, could not stow %s. Check for any conflicting files.\n" "$1"
        exit 1
    fi
}

usage() {
    printf "usage: ./install.sh <option>
    options:
    \tcyberia - laptop setup (ThinkPad T430 - 1600x900 - Artix runit)
    \tfluoride - desktop setup (1440p - Arch)\n"
    exit 1
}

if [[ "$1" != "cyberia" ]] && [[ "$1" != "fluoride" ]]; then
    usage
fi

create_missing_dir "$HOME/.config/vesktop"
create_missing_dir "$HOME/.config/jamesdsp"
create_missing_dir "$HOME/pic"

stow_dir "$1"
stow_dir "shared"
printf "done!\n"
exit 0
