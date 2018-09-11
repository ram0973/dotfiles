#!/bin/bash
sudo apt-get update
sudo apt-get install gnome-tweak-tool
sudo apt-get install gnome-shell-extensions
wget http://drive.noobslab.com/data/Mac/MacBuntu-Wallpapers.zip
unzip MacBuntu-Wallpapers.zip
rm MacBuntu-Wallpapers.zip
sudo add-apt-repository ppa:noobslab/macbuntu -y
sudo apt-get install macbuntu-os-icons-v1804 -y
sudo apt-get install macbuntu-os-ithemes-v1804 -y
