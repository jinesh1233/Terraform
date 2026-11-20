#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
audo systemctl start nginx
sudo systemctl enable nginx
echo "Nginx installation completed successfully."
