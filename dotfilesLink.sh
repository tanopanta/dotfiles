#!/bin/sh

ln -sf ~/dotfiles/.vimrc ~/.vimrc
#ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.bash_aliases ~/.bash_aliases
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

# install

sudo apt install tmux zsh 
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

