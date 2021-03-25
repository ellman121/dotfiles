#! /bin/bash

## Install Script

if [ $(uname) == Darwin ]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
elif [ $(uname) == Linux ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

mkdir -p ~/.config/htop
mkdir -p ~/bin

ln -s ./dot_emacs ~/.emacs
ln -s ./dot_gitconfig ~/.gitconfig
ln -s ./dot_config__htop__htoprc ~/.config/htop/htoprc
cp -a -v ./bin/* ~/bin # I don't want to symlink executables

if [ $(uname) == Darwin ]; then
    # Spectacle Settings
    cp -f ../macos/SpectacleShortcuts.json ~/Library/Application\ Support/Spectacle/Shortcuts.json

    # VSCode Settings (this only works automated on OSX)
    cd ../vscode && for e in `cat extensions.txt`; do code --install-extension $e; done; && cp *.json ~/Library/Application\ Support/Code/User

    # Homebrew is the dream
    brew bundle install
fi

read -r -p "Have you added brew zsh to /etc/shells, run chsh, and installed zinit? (y,n): " response

if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  CONTINUE=true
fi

if ! $CONTINUE; then
  echo "Please go set up zsh and zinit"
  exit
fi

ln -s ./dot_aliases ~/.aliases
ln -s ./dot_zshenv ~/.zshenv
ln -s ./dot_zshrc ~/.zshrc
