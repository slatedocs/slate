Vagrant.configure(2) do |config|
  config.vm.box = "debian/jessie64"
  config.vm.network :forwarded_port, guest: 4567, host: 4567
  config.vm.synced_folder ".", "/vagrant", type: "rsync"

  # Download and install ruby from sources and other tools
  config.vm.provision "shell",
    inline: <<-SHELL
        apt-get -yq install zlib1g-dev libssl-dev libreadline-dev libgdbm-dev openssl git libxml2-dev libxslt-dev build-essential nodejs
        wget https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.gz
        tar xvfz ruby-2.4.0.tar.gz
        cd ruby-2.4.0
        ./configure
        make
        make install
        gem install --no-ri --no-rdoc bundler
        rm -rf ruby-2.4.0.tar.gz ruby-2.4.0
        apt-get autoremove -yq
    SHELL

  # add the local user git config to the vm
  config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"

  # Install project dependencies (gems)
  config.vm.provision "shell",
    privileged: false,
    inline: <<-SHELL
      echo "=============================================="
      echo "Installing app dependencies"
      cd /vagrant
      bundle config build.nokogiri --use-system-libraries
      bundle install
    SHELL

  # Exec server
  config.vm.provision "shell",
    privileged: false,
    run: "always",
    inline: <<-SHELL
      echo "=============================================="
      echo "Starting up middleman at http://localhost:4567"
      echo "If it does not come up, check the ~/middleman.log file for any error messages"
      cd /vagrant
      bundle exec middleman server --watcher-force-polling --watcher-latency=1 &> ~/middleman.log &
    SHELL
end
