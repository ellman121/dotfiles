#! /bin/bash

# Backup Script

if [ $(uname) == Darwin ]; then
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
