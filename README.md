# Dotfiles (Ashish Shenoy)

[![forthebadge](https://forthebadge.com/images/badges/ctrl-c-ctrl-v.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/powered-by-black-magic.svg)](https://forthebadge.com)
[![forthebadge](https://forthebadge.com/images/badges/built-with-resentment.svg)](https://forthebadge.com)

Here's how this looks right now:

![Screenshot 1](.screenshots/screenshot1.png)
![Screenshot 2](.screenshots/screenshot2.png)

The programs whose dotfiles I'm currently tracking are:

- alacritty
- bash
- dunst
- git
- mpv
- neovim
- neofetch
- picom
- qtile
- rofi
- zsh

I'm currently using a [Git bare repository](https://www.atlassian.com/git/tutorials/dotfiles) to manage my dotfiles.

I've used [GNU Stow](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html) before to manage my dotfiles, but I've had problems with symlinks everywhere and the directory structure wasn't as clean as I would've liked. So I've migrated to a Git bare repository.

## Credits

- Thanks to [Christian Chiarulli](https://www.chrisatmachine.com/) for his excellent [Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch) repo, which got me to transition to a lua config, and also for his [nvim-basic-ide](https://github.com/LunarVim/nvim-basic-ide).
- Thanks to [Derek Taylor aka DistroTube](https://distro.tube/) for the qtile and rofi configs.
