#!/bin/bash

cd "${HOME}"

sudo apt-get install -y git curl zsh

if [[ ! -d ~/.zsh ]]; 
then
	mkdir ~/.zsh/
else 
	mv -f ~/.zsh ~/.zsh.old
fi

curl -L git.io/antigen > ~/.zsh/antigen.zsh


if [[ ! -f ~/.zshrc ]];
then
	mv -f ~/.zshrc ~/.zshrc_old
fi

curl -L https://raw.githubusercontent.com/sunowsir/my-zsh-conf/master/.zshrc > ~/.zshrc

