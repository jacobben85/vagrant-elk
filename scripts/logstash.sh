#!/bin/sh -e

echo 'deb http://packages.elastic.co/logstash/2.2/debian stable main' | tee /etc/apt/sources.list.d/logstash-2.2.x.list

apt-get update

apt-get -y install logstash
