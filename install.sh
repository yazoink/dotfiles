#!/bin/bash

if [[ -z "$HOME/.config/vesktop" ]]; then
    mkdir -p "$HOME/.config/vesktop"
fi
if [[ -z "$HOME/.config/vesktop" ]]; then
    mkdir "$HOME/pic"
fi

case $1 in
    cyberia) stow cyberia -t ~;;
    fluoruide) stow fluoride -t ~;;
    *) printf "usage: ./install.sh <option>\noptions:\n\tcyberia - laptop setup (ThinkPad T430 - 1600x900 - Artix runit)\n\tfluoride - desktop setup (1440p - Arch)\n";;
esac

stow shared -t ~
