#!/bin/bash -e

CURRENTDIR=$(pwd)

# install oh my zsh
cd $HOME
sudo apt install zsh fortune cowsay -y; \
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#install antigen
curl -L git.io/antigen > $HOME/antigen.zsh

# copy zshrc's
cd $CURRENTDIR
ln -s ./zshrc $HOME/zshrc
ln -s ./.zshrc $HOME/.zshrc

