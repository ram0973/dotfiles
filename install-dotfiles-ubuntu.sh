#!/bin/sh
sudo apt update
# sudo apt full-upgrade
sudo apt install -y git curl wget neofetch mc net-tools tldr wakeonlan nmap
git config --global user.name "ram0973"
git config --global user.email ram0973@gmail.com
# Set the cache to timeout after 9 hour (setting is in seconds)
git config --global credential.helper 'cache --timeout=32400'
ln -s -f ~/dotfiles/.vimrc ~/
ln -s -f ~/dotfiles/.bash_aliases ~/
ln -s -f ~/dotfiles/.bashrc ~/
. ~/.bashrc
