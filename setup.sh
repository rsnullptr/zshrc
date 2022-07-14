#!/bin/bash -e

CURRENTDIR=$(pwd)


#sudo apt install zsh fortune cowsay

# install oh my zsh
echo -e "\n TODO fix maybe... "
echo "!!! after oh my zsh installation simply type: exit"
echo -e "\n"

cd $HOME
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#install antigen
curl -L git.io/antigen > $HOME/antigen.zsh

# copy zshrc's
echo "your current .zshrc will be replaced (suffix .bkp)"
mv $HOME/.zshrc $HOME/.zshrc.bkp 2> /dev/null
cp ./.zshrc $HOME/.zshrc

touch custom.zsh
echo "export PATH=$(pwd)/scripts:$PATH" >> custom.zsh
echo "Put your custom stuff in: $(pwd)/custom.zsh"

# custom stuff in this very file
echo "source $(pwd)/zshrc" >> $HOME/.zshrc 
echo "source $(pwd)/custom.zsh" >> $HOME/.zshrc 

zsh
