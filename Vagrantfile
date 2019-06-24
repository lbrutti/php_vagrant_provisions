Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.name = "vagrant_test_2"
  end
  config.vm.box = "ubuntu/xenial64"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.provision :shell, path: "bootstrap.sh"
end