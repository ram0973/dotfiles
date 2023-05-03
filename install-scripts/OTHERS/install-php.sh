sudo apt-get purge php7.* -y && sudo apt-get autoclean && sudo apt-get autoremove -y
sudo add-apt-repository ppa:ondrej/php
sudo apt install -y php8.2-cli php8.2-fpm php8.2-pgsql php8.2-curl php8.2-mbstring php8.2-zip php8.2-dom php8.2-soap
sudo update-alternatives --config php