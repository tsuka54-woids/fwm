VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos7_rails"
  config.vm.box_url = "http://172.16.1.110/vagrant/centos7_rails_1.01.box"
  config.vm.provider :virtualbox do |vb|
    vb.customize [ 'modifyvm', :id, '--memory', 1024 ]
  end
  config.vm.network "forwarded_port", guest: 3000, host: 4000
  config.vm.network "forwarded_port", guest: 80, host: 80
  config.vm.network :forwarded_port, id: "ssh", guest: 22, host: 2226
  
  config.vm.synced_folder "./", "/vagrant", owner: 'vagrant', group: 'apache', mount_options: ['dmode=777', 'fmode=777']
end
