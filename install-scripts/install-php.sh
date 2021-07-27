sudo apt-get purge php7.* -y && sudo apt-get autoclean && sudo apt-get autoremove -y
sudo add-apt-repository ppa:ondrej/php
sudo apt install -y php8.0-cli php8.0-fpm php8.0-pgsql php8.0-curl php8.0-mbstring php8.0-zip php8.0-dom php8.0-soap
sudo update-alternatives --config php