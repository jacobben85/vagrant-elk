#!/bin/sh -e

apt-get -y install nginx apache2-utils

cp /vagrant/configs/nginx.default /etc/nginx/sites-available/default

service nginx restart
