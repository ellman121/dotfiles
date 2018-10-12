#! /bin/bash

# Backup Script
# Runinng this script will backup all my mac_os settings.

# Dotfiles from ~
cp ~/.bash_profile ./dot_bash_profile
cp ~/.bash_aliases ./dot_bash_aliases
cp ~/.config/htop/htoprc ./dot_config__htop__htoprc
cp ~/.emacs ./dot_emacs

# Some things I keep in ~bin
cp -r ~/bin ./

# Backup homebrew things
# NOTE: `brew bundle dump` doesn't look at global cask arguments, so I'm
# having it insert my cask args into the top of the file as a second step
brew bundle dump --force
echo "cask_args appdir: \"/Applications\"\n$(cat Brewfile)" > Brewfile

# Backup Spectacle
cp -f ~/Library/Application\ Support/Spectacle/Shortcuts.json ./SpectacleShortcuts.json

# Backup VSCode
cd ../vscode && code --list-extensions > extensions.txt && cp ~/Library/Application\ Support/Code/User/*.json ./
