hsetroot -fill ~/pic/wallpaper.png
dwmblocks &
picom &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
exec dbus-run-session pipewire &
exec dbus-run-session pipewire-pulse &
exec dbus-run-session wireplumber &
exec /home/gene/.local/bin/bat-warn &
exec dbus-run-session dwm
