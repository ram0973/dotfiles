#!/bin/bash
sudo rm -rf /usr/share/themes/{Arc,Arc-Darker,Arc-Dark}
rm -rf ~/.local/share/themes/{Arc,Arc-Darker,Arc-Dark}
rm -rf ~/.themes/{Arc,Arc-Darker,Arc-Dark}
sudo add-apt-repository ppa:noobslab/themes
sudo add-apt-repository ppa:noobslab/icons
sudo apt-get install arc-theme
sudo apt-get install arc-icons
wget http://drive.noobslab.com/data/Mac/MacBuntu-Wallpapers.zip
unzip MacBuntu-Wallpapers.zip
rm MacBuntu-Wallpapers.zip
gsettings set org.gnome.desktop.interface gtk-theme "Arc"
gsettings set org.gnome.desktop.wm.preferences theme "Arc"
