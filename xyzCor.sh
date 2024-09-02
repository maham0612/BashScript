#!/bin/bash

echo "## Welcome to deployment ##"
if [ ! -d "/home/maham/xyz_code/XYZCorp_IAC/" ]; then
    cd /home/maham/xyz_code/
    echo "Cloning the repository..."
    git clone https://github.com/ateeb327/XYZCorp_IAC.git
    cd XYZCorp_IAC/
else
    echo "Repository already cloned. Pulling the latest changes..."
    cd /home/maham/xyz_code/XYZCorp_IAC/
    git pull origin master
fi
echo "Moving file into default directory..."
sudo cp * /var/www/html/
echo "## End ##"
