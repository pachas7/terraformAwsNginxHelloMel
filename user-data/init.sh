#!/bin/bash
sudo amazon-linux-extras install -y nginx1
sudo systemctl start nginx
sudo chmod 0777 /usr/share/nginx/html/index.html
echo -e "<!DOCTYPE html>
  <html>
  <head>
      Hello Mel!
  </head>
  <body>
      olakase
  </body>
  </html" > /usr/share/nginx/html/index.html