## Install
Assuming base Arch/Artix install with graphics drivers
- `$ sudo pacman -S stow git`
- `$ git clone https://github.com/yazoink/dotfiles && mv dotfiles ~/.dotfiles && cd ~/.dotfiles`
- `./install.sh cyberia` or `./install.sh fluoride` or `./install.sh shared`

## Differences between options
### cyberia
- size 12 font, optimal for smaller resolutions
- support for the classic ThinkPad volume keys in DWM
- built for Artix with the runit init system
- dwmblocks status bar with volume and battery modules
- low battery notification script

### fluoride
- size 14 font to suit a 1440p monitor
- no volume keys in DWM in favor of using hardware controls
- built for Arch with systemd
- status bar is a shell script without volume or battery modules

`./install.sh shared` will only symlink the files shared between cyberia and fluoride.

## Packages, etc.
### Arch repo packages
- `$ sudo pacman -S polkit-gnome alacritty dunst picom libnotify mpc mpd ncmpcpp mpv neovim qt5ct qt6ct ranger ueberzug rofi zathura zathura-cb zathura-djvu zathura-pdf-mupdf zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting slock ttf-cascadia-code ttf-cascadia-code-nerd ttf-cascadia-code lxappearance hsetroot`

### AUR packages
- `$ aurget -i jamesdsp-git nvim-packer-git vesktop-bin floorp-bin bettergruvbox-gtk-theme gruvbox-plus-icon-theme-git qt5-styleplugins`

### Change shell
- `$ chsh -s $(which zsh)`
- log out and in again

## Install suckless builds
### DWM
- `$ sudo pacman -S xorg-server xorg-xsetroot xorg-xrandr xorg-xinit libx11 libxft` (plus whatever drivers are needed)
- `$ cd ~/.config/dwm`
- `$ sudo make clean install`

### dwmblocks \(cyberia only\)
- `$ cd ~/.config/dwmblocks`
- `$ sudo make clean install`

### slock
- `$ cd ~/.config/slock`
- `$ sudo make clean install`

## Make neovim work
- `$ cd ~/.dotfiles/nvim/.config/nvim/lua`
- `$ vim plugins.lua`
- `:PackerSync`

## Screenshots
### cyberia
![2024-03-12-21:01:40-screenshot](https://github.com/yazoink/dotfiles/assets/98802603/a12b5a0a-2fe3-4959-a784-4f1783664c6b)
![2024-03-12-21:01:15-screenshot](https://github.com/yazoink/dotfiles/assets/98802603/c23f213f-a5fa-46bc-9dd7-368c1be1b2d2)
![2024-03-12-21:00:51-screenshot](https://github.com/yazoink/dotfiles/assets/98802603/ef9e7ac6-0cb4-4f7b-ab73-d900270b899a)
![2024-03-12-20:59:26-screenshot](https://github.com/yazoink/dotfiles/assets/98802603/7241f647-97b7-4e0e-bb6a-afcc5dfe2f48)
### fluoride
will post when I can be bothered
