#!/bin/sh -e

wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -
echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" | tee -a /etc/apt/sources.list.d/elasticsearch-2.x.list

apt-get --assume-yes update

apt-get -y install elasticsearch

sed -i "s/# network.host: 192.168.0.1/network.host: localhost/" "/etc/elasticsearch/elasticsearch.yml"

service elasticsearch restart
update-rc.d elasticsearch defaults 95 10
