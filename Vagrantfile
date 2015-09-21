# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  #config.vm.box = "misheska/ubuntu1404-i386"
  config.vm.box = "phusion/ubuntu-14.04-amd64"
  config.vm.boot_timeout = 600

  if Vagrant.has_plugin?("vagrant-env") and Vagrant.has_plugin?("vagrant-proxyconf")
    config.env.enable
    config.proxy.http     = ENV['HTTP_PROXY']
    config.proxy.https    = ENV['HTTPS_PROXY']
    config.proxy.no_proxy = ENV['NO_PROXY']
  end

  # fix "stdin: is not a tty" error
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  config.vm.define "docker" do |docker|
    docker.vm.hostname = "docker"
    docker.vm.network "private_network", ip: "192.168.50.10"
    #docker.vm.provision :shell, :path => "install_docker.sh"
    docker.vm.provider :virtualbox do |vb|
      vb.memory = 2048
      vb.cpus = 3
    end

    docker.vm.provision :docker, version: "latest"
  end

end
