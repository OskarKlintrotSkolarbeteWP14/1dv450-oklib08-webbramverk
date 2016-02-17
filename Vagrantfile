# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure('2') do |config|
  config.vm.box      = 'ubuntu/trusty64'
  config.vm.hostname = 'rails-dev-box'

  config.vm.network :forwarded_port, guest: 3000, host: 8080
  config.vm.network :forwarded_port, guest: 3001, host: 8081
  config.vm.network :forwarded_port, guest: 3002, host: 8082

  config.vm.provision :shell, path: 'bootstrap.sh', keep_color: true

  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder ".", "/home/vagrant"
end
