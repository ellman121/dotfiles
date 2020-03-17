#! /bin/bash

## Install Script

if [ $(uname) == Darwin ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else if [ $(uname) == Linux ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Yes, I could (and probably should) symlink these, but not right now
cp -v ./dot_bash_aliases ~/.bash_aliases
cp -v ./dot_config__htop__htoprc ~/.config/htop/htoprc
cp -v ./dot_emacs ~/.emacs

if [ $(uname) == Linux ]; then
    cp -v ./dot_bash_full ~/.bashrc
    cp -v ./dot_bash_profile_linux ~/.bash_profile
else # OSX
    cp -v ./dot_bash_full ~/.bash_profile

    # Spectacle Settings
    cp -f ../macos/SpectacleShortcuts.json ~/Library/Application\ Support/Spectacle/Shortcuts.json

    # VSCode Settings (this only works automated on OSX)
    cd ../vscode && for e in `cat extensions.txt`; do code --install-extension $e; done; && cp *.json ~/Library/Application\ Support/Code/User

    # Homebrew is the dream
    brew bundle install
fi

# Some things I keep in ~bin
cp -a -v ./bin/* ~/bin 
