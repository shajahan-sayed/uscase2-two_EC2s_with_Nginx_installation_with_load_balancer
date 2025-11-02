#!/bin/bash
sudo amazon-linux-extras install nginx1 -y
echo "Hi balu welcome to Nginx" > /usr/share/nginx/html/index.html
systemctl enable nginx
systemctl start nginx
