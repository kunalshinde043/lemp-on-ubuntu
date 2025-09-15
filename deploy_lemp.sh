#!/bin/bash
# deploy_lemp.sh
# Script to install and configure LEMP stack on Ubuntu EC2

echo "=== Step 1: Update Packages ==="
sudo apt update && sudo apt upgrade -y

echo "=== Step 2: Install Required Packages ==="
sudo apt install nginx mysql-server php-fpm php-mysql -y

echo "=== Step 3: Start and Enable Services ==="
sudo systemctl start nginx mysql php8.3-fpm
sudo systemctl enable nginx mysql php8.3-fpm

echo "=== Step 4: Verify Service Status ==="
sudo systemctl status nginx mysql php8.3-fpm

echo "=== Step 5: Create a Test HTML Page ==="
sudo bash -c 'echo "<h1>Welcome to Nginx on Ubuntu</h1>" > /var/www/html/index.html'

echo "=== Step 6: Create a Test PHP Page ==="
sudo bash -c 'echo "<?php phpinfo(); ?>" > /var/www/html/index.php'

echo "=== Step 7: Verify MySQL Installation ==="
echo "Run the following manually to verify MySQL:"
echo "sudo mysql"
echo "SHOW DATABASES;"

echo "=== Step 8: Test Browser Access ==="
echo "Visit http://<YOUR_PUBLIC_IP> to see HTML page"
echo "Visit http://<YOUR_PUBLIC_IP>/index.php to see PHP info page"

echo "=== LEMP Stack Deployment Completed Successfully ==="
