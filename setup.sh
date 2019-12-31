#!/bin/bash

cd "${HOME}"

sudo apt-get install git curl 

mkdir ~/.zsh/

curl -L git.io/antigen > ~/.zsh/antigen.zsh

mv ~/.zshrc ~/.zshrc_old

curl -L https://raw.githubusercontent.com/sunowsir/my-zsh-conf/master/.zshrc > ~/.zshrc
