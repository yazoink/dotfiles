### Install
- `$ sudo pacman -S stow git`
- `$ git clone https://github.com/yazoink/dotfiles && mv dotfiles ~/.dotfiles && cd ~/.dotfiles`
- `./install.sh cyberia` or `./install.sh fluoride`

### Packages, etc.
#### Arch repo packages
- `$ sudo pacman -S polkit-gnome alacritty dunst libnotify mpc mpd ncmpcpp mpv neovim qt5ct qt6ct ranger ueberzug rofi zathura zathuta-cb zathura-djvu zathura-pdf-mupdf zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting slock ttf-cascadia-code otf-font-awesome ttf-cascadia-code-nerd ttf-cascadia-code lxappearance hsetroot`

#### AUR packages
- `$ aurget -i jamesdsp-git nvim-packer-git vesktop-bin floorp-bin bettergruvbox-gtk-theme gruvbox-plus-icon-theme-git qt5-styleplugins`

#### Change shell
- `$ chsh -s $(which zsh)`
- log out and in again

#### Install DWM
- `$ sudo pacman -S xorg-server xorg-xsetroot xorg-xrandr xorg-xinit libx11 libxft` (plus whatever drivers are needed)
- `$ cd ~/.config/dwm`
- `$ sudo make clean install`

#### Make neovim function
- `$ cd ~/.dotfiles/nvim/.config/nvim/lua`
- `$ vim plugins.lua`
- `:PackerSync`
