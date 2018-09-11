#!/bin/bash
sudo rm -rf /usr/share/themes/{Arc,Arc-Darker,Arc-Dark}
rm -rf ~/.local/share/themes/{Arc,Arc-Darker,Arc-Dark}
rm -rf ~/.themes/{Arc,Arc-Darker,Arc-Dark}
git clone https://github.com/NicoHood/arc-theme --depth 1 && cd arc-theme
./autogen.sh --prefix=/usr
sudo make install
git clone https://github.com/horst3180/arc-icon-theme --depth 1 && cd arc-icon-theme
./autogen.sh --prefix=/usr
sudo make install
wget http://drive.noobslab.com/data/Mac/MacBuntu-Wallpapers.zip
unzip MacBuntu-Wallpapers.zip
rm MacBuntu-Wallpapers.zip
gsettings set org.gnome.desktop.interface gtk-theme "Arc-Dark"
gsettings set org.gnome.desktop.wm.preferences theme "Arc-Dark"
