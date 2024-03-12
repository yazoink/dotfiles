if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec startx
fi

mpd >/dev/null 2>&1 &
