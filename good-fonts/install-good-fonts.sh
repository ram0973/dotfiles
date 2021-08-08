echo
echo "This script will make fonts in Ubuntu-based OS look good"
echo "Make backup of /etc/fonts/local.conf"
echo "Place ttf fonts to ~/fonts"
read -rsn1 -p "Press any key to continue or Ctrl+C to quit... "; echo
sudo cp local.conf /etc/fonts/
sudo mkdir -p /usr/share/fonts/truetype/msttcorefonts/
sudo cp ~/fonts/*.ttf  /usr/share/fonts/truetype/msttcorefonts/
