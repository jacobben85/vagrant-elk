# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "private_network", ip: "192.168.56.104"
  config.vm.hostname = "elk.vagrant-local.jbj"

  config.vm.provider "virtualbox" do |v|
    v.memory = 4098
    v.cpus = 2
  end

  # port1 = 80
  #
  # config.vm.network(:forwarded_port, guest: port1, host: port1)

  config.vm.provision "shell",
    path: "scripts/bootstrap.sh"

  config.vm.provision "shell",
    path: "scripts/startup.sh",
  run: "always"

  config.vm.provision "shell",
    path: "scripts/elasticsearch.sh"

  config.vm.provision "shell",
    path: "scripts/kibana.sh"

  config.vm.provision "shell",
    path: "scripts/nginx.sh"

  config.vm.provision "shell",
    path: "scripts/logstash.sh"
end
