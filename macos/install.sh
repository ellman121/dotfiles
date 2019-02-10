#! /bin/bash

# Install Script
# Runinng this script will move my shit into place and install necessary things

# Install Homebrew
./install_homebrew.sh

# Install brews
brew bundle install

# Move dotfiles into place
cp ./dot_bash_profile ~/.bash_profile
cp ./dot_bash_aliases ~/.bash_aliases
mkdir -p ~/.config/htop && cp ./dot_config__htop__htoprc ~/.config/htop/htoprc
cp ./dot_emacs ~/.emacs

# Move bin into place
cp -r ./bin ~/bin

# Spectacle settings
cp ./SpectacleShortcuts.json ~/Library/Application\ Support/Spectacle/Shortcuts.json

# Run OSX-For-Hackers
./osx-for-hackers-ellman121.sh

# Backup VSCode
cd ../vscode && for e in `cat extensions.txt`; do code --install-extension $e; done; && cp *.json ~/Library/Application\ Support/Code/User
