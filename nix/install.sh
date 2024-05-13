#! /bin/bash

## Install Script

### Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Homebrew is the dream
brew bundle install

read -r -p "Is zsh (from homebrew / OSX) set to be your default shell: " response

if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  CONTINUE=true
fi

if ! $CONTINUE; then
  echo "Please go set up zsh"
  exit
fi

# Install zinit
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

mkdir -p ~/.config/htop
mkdir -p ~/bin

CWD=$(pwd)
ln -s $CWD/dot_emacs ~/.emacs
ln -s $CWD/dot_gitconfig ~/.gitconfig
ln -s $CWD/dot_config__htop__htoprc ~/.config/htop/htoprc
cp -a -v ./bin/* ~/bin # I don't want to symlink executables
ln -s $CWD/dot_aliases ~/.aliases
ln -s $CWD/dot_zshrc ~/.zshrc
