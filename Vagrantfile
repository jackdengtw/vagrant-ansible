# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "centos/7"

  config.vm.define "ansible", primary: true do |ansible|
    ansible.vm.network "private_network", ip: "192.168.50.76"
    ansible.vm.synced_folder ".", "/ansible", type: "virtualbox"
    ansible.vm.provision "shell", privileged: false, inline: <<-EOF
      set -e

      sudo yum update && sudo yum install -y \
        git \
        python-setuptools \
        python-devel \
        gcc \
        libffi-devel \
        openssl-devel
      sudo easy_install pip
      sudo -H pip install -U pip setuptools
      sudo -H pip install ansible==2.3.1.0

      echo "cd /ansible" >> ~/.profile
      echo "source ~/.profile" >> ~/.bash_profile
      ssh-keygen -f ~/.ssh/id_rsa -P ''
      cp ~/.ssh/id_rsa.pub /ansible
    EOF
  end

  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.network "private_network", ip: "192.168.50.77"
    jenkins.vm.provision "shell", privileged:false, inline: <<-JENKINS
        set -e

        cat /vagrant/id_rsa.pub >> ~/.ssh/authorized_keys
    JENKINS
  end

end
