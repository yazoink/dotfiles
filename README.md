### Install
- `$ sudo pacman -S stow git`
- `$ git clone https://github.com/yazoink/desktop-dotfiles && mv desktop-dotfiles ~/.dotfiles && cd ~/.dotfiles`
- `$ cd directory-name` cyberia for laptop or fluoride for desktop
- `$ stow * -t ~`

### Packages, etc.
#### Arch repo packages
- `$ sudo pacman -S polkit-gnome alacritty dunst libnotify mpc mpd ncmpcpp mpv neovim qt5ct qt6ct ranger ueberzug rofi zathura zathuta-cb zathura-djvu zathura-pdf-mupdf zsh zsh-autosuggestions zsh-completions zsh-syntax-highlighting slock ttf-cascadia-code otf-font-awesome ttf-cascadia-code-nerd lxappearance hsetroot`

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

### Screenshot(s)
#### cyberia
![2024-03-06-14:55:42-screenshot](https://github.com/yazoink/dotfiles/assets/98802603/aaf74465-473d-4890-ab3c-d9bb691e7a30)
![2024-03-06-14:54:56-screenshot](https://github.com/yazoink/dotfiles/assets/98802603/58f2cf4a-2b04-4837-b2b6-e5ca21e89ffd)

#### fluoride
![2024-03-06-00:12:20-screenshot](https://github.com/yazoink/dotfiles/assets/98802603/c83be7e5-fff7-40d4-90e5-cfa5fdb0419f)
![2024-03-06-00:14:34-screenshot](https://github.com/yazoink/dotfiles/assets/98802603/0165eb39-88c4-48ac-b4d2-8c58cba03d83)
![2024-03-06-00:16:47-screenshot](https://github.com/yazoink/dotfiles/assets/98802603/cdb5a375-908d-446e-9d8e-7828737ec358)
