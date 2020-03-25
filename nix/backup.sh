#! /bin/bash

# Backup Script

# Yes, I could (and probably should) symlink these, but not right now
cp -v ~/.bash_aliases ./dot_bash_aliases
cp -v ~/.config/htop/htoprc ./dot_config__htop__htoprc
cp -v ~/.emacs ./dot_emacs

if [ $(uname) == Linux ]; then
    cp -v ~/.bashrc ./dot_bash_full
    cp -v ~/.bash_profile ./dot_bash_profile_linux
else # OSX
    cp -v ~/.bash_profile ./dot_bash_full
   
    # Backup Spectacle
    cp -f ~/Library/Application\ Support/Spectacle/Shortcuts.json ../macos/SpectacleShortcuts.json
    
    # Backup VSCode
    cd ../vscode && code --list-extensions > extensions.txt && cp ~/Library/Application\ Support/Code/User/*.json ./

     # Backup homebrew things
    # NOTE: `brew bundle dump` doesn't look at global cask arguments, so I'm
    # having it insert my cask args into the top of the file as a second step
    echo "Backing up homebrew casks / setup ..." 
    brew bundle dump --force
    echo "cask_args appdir: \"/Applications\"\n$(cat Brewfile)" > Brewfile
fi

# Some things I keep in ~bin
cp -a -v ./bin/* ~/bin 
