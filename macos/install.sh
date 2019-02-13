#! /bin/bash

# Install Script
# Runinng this script will move my shit into place and install necessary things

# Install Homebrew
./install_homebrew.sh

# Install brews
brew bundle install

# Setup rbenv and pyenv
rbenv install $(cat ruby_version)
rbenv global $(cat ruby_version)
pyenv install $(cat python_version)
pyenv global $(cat ruby_version)

# Move dotfiles into place
cp -v ./dot_bash_profile ~/.bash_profile
cp -v ./dot_bash_aliases ~/.bash_aliases
cp -v ./dot_config__htop__htoprc ~/.config/htp/htoprc
cp -v ./dot_emacs ~/.emacs

# Move bin into place
cp -r -v ./bin ~/bin

# Spectacle settings
cp -r ./SpectacleShortcuts.json ~/Library/Application\ Support/Spectacle/Shortcuts.json

# Run OSX-For-Hackers
./osx-for-hackers-ellman121.sh

# Insatll VSCode things
cd ../vscode && for e in `cat extensions.txt`; do code --install-extension $e; done; && cp *.json ~/Library/Application\ Support/Code/User
