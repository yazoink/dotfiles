#!/bin/bash

create_missing_dir() {
    if [[ -z "$1" ]]; then
        mkdir -p "$1"
        if [[ $? != 0 ]]; then
            printf "Installation failed, could not create directory %s. Make sure you have permission to do so.\n" "$1"
            exit 1
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
    \tshared - files shared between setups
    \tcyberia - laptop setup (ThinkPad T430 - 1600x900 - Artix runit)
    \tfluoride - desktop setup (1440p - Arch)\n"
} 

if [[ "$1" == "-h" ]] || [[ $1 == "--help" ]]; then
    usage
    exit 0
fi

if [[ -d "$1" ]]; then
    declare -A USER_DIRS=(
        [Desktop]=desk
        [Downloads]=dl
        [Templates]=tmpl
        [Public]=pub
        [Documents]=doc
        [Music]=mu
        [Pictures]=pic
        [Videos]=vid
    )

    for KEY in "${!USER_DIRS[@]}"; do
        if [[ -d "$HOME/$KEY" ]]; then
            mv "$HOME/$KEY" "$HOME/${USER_DIRS[$KEY]}"
        fi
    done

    create_missing_dir "$HOME/.config/vesktop"
    create_missing_dir "$HOME/.config/jamesdsp"
    create_missing_dir "$HOME/pic"

    stow_dir "shared"

    if [[ "$1" != "shared" ]]; then
        stow_dir "$1"
    fi

    printf "done!\n"
    exit 0
else
    usage
    exit 1
fi

