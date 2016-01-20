# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = 'disusered/volabit'

  # Open ports:
  # 4567  - Middleman
  config.vm.network :forwarded_port, guest: 4567, host: 4567

  # NFS
  config.vm.network 'private_network', ip: '192.168.50.4'
  config.vm.synced_folder '.', '/vagrant', type: 'nfs'

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  config.vm.provider 'virtualbox' do |vb|
    vb.customize ['modifyvm', :id, '--memory', '2048']
  end

  # Provision application
  config.vm.provision 'shell',
                      privileged: false,
                      path: '/usr/bin/vagrant'
end
