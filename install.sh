#!/bin/bash

prompt() {
    printf "%s (y/n) " "$1"
    read answer
    if [[ ${answer^^} == "Y" ]] || [[ ${answer^^} == "YES" ]]; then
        return 0
    elif [[ ${answer^^} == "N" ]] || [[ ${answer^^} == "NO" ]]; then
        return 1
    else
        prompt "$1"
    fi
}

create_missing_dir() {
    if [[ -z "$1" ]]; then
        if ! mkdir -p "$1"; then
            printf "Installation failed, could not create directory %s. Make sure you have permission to do so.\n" "$1"
            exit 1
        fi
    fi
}

stow_dir() {
    if ! stow "$1" -t ~; then
        printf "Installation failed, could not stow %s. Check for any conflicting files.\n" "$1"
        exit 1
    fi
}

usage() {
    printf "usage: ./install.sh <option>
    options:
    \tcyberia - laptop setup (ThinkPad T430 - 1600x900 - Artix runit)
    \tfluoride - desktop setup (1440p - Arch)\n"
} 

if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
    usage
    exit 0
fi

if [[ -d "$1" ]] && [[ "$1" != "shared" ]]; then
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
    stow_dir "$1"

    prompt "Compile suckless builds?"
    if [[ $? == 0 ]]; then
        sudo pacman -S xorg-server xorg-xsetroot xorg-xrandr xorg-xinit libx11 libxft
        SUCKLESS_BUILDS=("dwm" "dwmblocks" "slock")
        for BUILD in "${SUCKLESS_BUILDS[@]}"; do
            printf "Installing %s...\n" "$BUILD"
            (
                cd "$HOME/.config/$BUILD" || exit
                if ! sudo make clean install; then
                    printf "%s failed to compile.\n" "$BUILD"
                    exit 1
                fi
            )
            printf "%s installed.\n\n" "$BUILD"
        done
    fi

    BASE_PKGS_MAIN=("polkit-gnome" "alacritty" "dunst" "picom" "libnotify" "qt5ct" "qt6ct" "ranger" "ueberzug" "rofi" "ttf-cascadia-code" "ttf-cascadia-code-nerd" "ttf-cascadia-code" "lxappearance" "hsetroot" "gtk-engines")
    BASE_PKGS_AUR=("floorp-bin" "bettergruvbox-gtk-theme" "gruvbox-plus-icon-theme-git" "qt5-styleplugins")

    printf "\n$(echo ${BASE_PKGS_MAIN[@]} ${BASE_PKGS_AUR[@]})\n\n"
    prompt "Install packages for base desktop?"
    if [[ $? == 0 ]]; then
        sudo pacman -S "${BASE_PKGS_MAIN[@]}"
        "$HOME/.local/bin/aurget" -i "${BASE_PKGS_AUR[@]}"
    fi
    
    ADDITIONAL_PKGS_MAIN=("mpv" "neovim" "vim" "zathura" "zathura-cb" "zathura-djvu" "zathura-pdf-mupdf" "signal-desktop" "gimp" "pcmanfm" "gvfs" "udisks2" "udiskie" "imv" "yt-dlp" "ffmpeg" "audacity" "nicotine+" "galculator" "keepassxc" "htop" "fastfetch" "texlive-meta" "thunderbird")
    ADDITIONAL_PKGS_AUR=("floorp-bin" "vesktop-bin" "jamesdsp-git" "qbittorrent-enhanced-qt5")
    
    printf "\n$(echo ${ADDITIONAL_PKGS_MAIN[@]} ${ADDITIONAL_PKGS_AUR[@]})\n\n"
    prompt "Install additional packages?"
    if [[ $? == 0 ]]; then
        sudo pacman -S "${ADDITIONAL_PKGS_MAIN[@]}"
        "$HOME/.local/bin/aurget" -i "${ADDITIONAL_PKGS_AUR[@]}"
    fi

    prompt "Install and switch to ZSH?"
    if [[ $? == 0 ]]; then
        sudo pacman -S zsh zsh-completions zsh-autosuggestions zsh-syntax-highlighting
        chsh -s $(which zsh)
        printf "Log out and in again (or better, reboot) for changes to take effect.\n"
    fi

    printf "\ndone!\n"
    exit 0
else
    usage
    exit 1
fi

