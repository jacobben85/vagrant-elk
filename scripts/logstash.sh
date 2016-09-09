#!/bin/sh -e

echo 'deb http://packages.elastic.co/logstash/2.2/debian stable main' | tee /etc/apt/sources.list.d/logstash-2.2.x.list

apt-get update

apt-get -y install logstash

cat <<CONF >> /etc/logstash/conf.d/sample-pipeline.conf
input {
    file {
        path => "/vagrant/sample-data/access_log"
        start_position => beginning
        ignore_older => 0
    }
}
filter {
    grok {
        match => { "message" => "%{COMBINEDAPACHELOG}"}
    }
    geoip {
        source => "clientip"
    }
}
output {
    elasticsearch {
        hosts => [ "localhost:9200" ]
    }
}
CONF

echo "Running a config test"
/opt/logstash/bin/logstash -f /etc/logstash/conf.d/sample-pipeline.conf --configtest

service logstash restart
update-rc.d logstash defaults
update-rc.d logstash enable
