# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "misheska/ubuntu1404-i386"
  config.vm.boot_timeout = 600

  # fix "stdin: is not a tty" error
  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  config.vm.define "docker" do |docker|
    docker.vm.hostname = "docker"
    docker.vm.network "private_network", ip: "192.168.50.10"
    docker.vm.provision :shell, :path => "install_docker.sh"
    docker.vm.provider :virtualbox do |vb|
      vb.memory = 2048
      vb.cpus = 3
    end
  end

end
