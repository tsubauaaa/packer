#!/bin/bash
if [ "$PACKER_BUILDER_TYPE" == "virtualbox-iso" ] || [ "$PACKER_BUILDER_TYPE" == "vmware-iso" ] ; then
  /bin/mkdir -pm 700 /home/vagrant/.ssh
  /usr/bin/curl -L 'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub' > "/home/vagrant/.ssh/authorized_keys"
  /bin/chmod 0600 /home/vagrant/.ssh/authorized_keys
  /bin/chown -R vagrant:vagrant /home/vagrant/.ssh
else
  exit 0
fi
