#!/bin/bash
set -e
repo_dir="/home/maham/test/"
repo_url="https://github.com/maham0612/test.git"
github_repo="/home/maham/test/test/"

if dpkg -l | grep -qw nginx; then
	echo "Nginx is already installed"
else
	echo"Installing Nginx..."
	sudo apt install nginx
	systemctl start nginx
fi
systemctl status nginx --no-pager -l

if [ ! -d "$github_repo" ]; then
	echo "Cloning..."
	cd /home/maham/test/
	git clone $repo_url
	cd $github_repo
else
	echo "Pulling..."
	cd $github_repo
	git pull
fi
sudo cp * /var/www/html/
echo "End"

