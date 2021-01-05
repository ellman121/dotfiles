#! /bin/bash

## Install Script

if [ $(uname) == Darwin ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
elif [ $(uname) == Linux ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Yes, I could (and probably should) symlink these, but not right now
cp -v ./dot_aliases ~/.aliases
cp -v ./dot_zshenv ~/.zshenv
cp -v ./dot_zshrc ~/.zshrc
cp -v ./dot_emacs ~/.emacs

mkdir -p ~/.config/htop
cp -v ./dot_config__htop__htoprc ~/.config/htop/htoprc

if [ $(uname) == Darwin ]; then
    # Spectacle Settings
    cp -f ../macos/SpectacleShortcuts.json ~/Library/Application\ Support/Spectacle/Shortcuts.json

    # VSCode Settings (this only works automated on OSX)
    cd ../vscode && for e in `cat extensions.txt`; do code --install-extension $e; done; && cp *.json ~/Library/Application\ Support/Code/User

    # Homebrew is the dream
    brew bundle install
fi

# Some things I keep in ~bin
cp -a -v ./bin/* ~/bin 
