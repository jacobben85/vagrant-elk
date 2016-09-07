#!/bin/sh -e

echo "deb http://packages.elastic.co/kibana/4.4/debian stable main" | tee -a /etc/apt/sources.list.d/kibana-4.4.x.list

apt-get update

apt-get -y install kibana

sed -i "s/# server.host: \"0.0.0.0\"/server.host: \"localhost\"/" "/opt/kibana/config/kibana.yml"

update-rc.d kibana defaults 96 9

service kibana restart
