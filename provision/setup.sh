sudo apt-get update
sudo apt-get install apache2 -y
sudo apt-get install php5 -y
sudo apt-get install sqlite -y
sudo apt-get install php5-sqlite -y
sudo apt-get install openjdk-7-jdk -y

sudo a2enmod expires
sudo a2enmod rewrite

sudo a2dissite 000-default.conf

sudo cp /vagrant/provision/taskboard.example.com.conf /etc/apache2/sites-available/taskboard.example.com.conf

sudo mkdir -p /var/www/taskboard/public_html
sudo mkdir /var/www/taskboard/logs
sudo a2ensite taskboard.example.com.conf

sudo service apache2 restart


cd /var/www/taskboard/public_html
sudo apt-get install git -y
sudo git clone https://github.com/kiswa/TaskBoard.git .
sudo ./build/composer.phar self-update
sudo ./build/composer.phar install
sudo ./build/build-all

cd ../..
sudo chown -R www-data:www-data taskboard
