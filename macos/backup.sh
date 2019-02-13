#! /bin/bash

# Backup Script
# Runinng this script will backup all my mac_os settings.

# Dotfiles from ~
# Yes, I could (and probably should) symlink these, but not right now
cp -v ~/.bash_profile ./dot_bash_profile
cp -v ~/.bash_aliases ./dot_bash_aliases
cp -v ~/.config/htop/htoprc ./dot_config__htop__htoprc
cp -v ~/.emacs ./dot_emacs

# Some things I keep in ~bin
cp -a -v ~/bin ./

# Backup homebrew things
# NOTE: `brew bundle dump` doesn't look at global cask arguments, so I'm
# having it insert my cask args into the top of the file as a second step
echo "Backing up homebrew casks / setup ..." 
brew bundle dump --force
echo "cask_args appdir: \"/Applications\"\n$(cat Brewfile)" > Brewfile

# Backup ruby and python versions
rbenv version | awk '{print $1;}' > ruby_version
pyenv version | awk '{print $1;}' > python_version

# Backup Spectacle
cp -f ~/Library/Application\ Support/Spectacle/Shortcuts.json ./SpectacleShortcuts.json

# Backup VSCode
cd ../vscode && code --list-extensions > extensions.txt && cp ~/Library/Application\ Support/Code/User/*.json ./
