#!/bin/bash
if [ "$PACKER_BUILDER_TYPE" == "virtualbox-iso" ] ; then
  VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
  cd /tmp
  mount -o loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
  sh /mnt/VBoxLinuxAdditions.run
  umount /mnt
  rm -rf /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso
elif [ "$PACKER_BUILDER_TYPE" == "vmware-iso" ] ; then
  yum -y install fuse-libs
  mount -t iso9660 -o loop /home/vagrant/linux.iso /mnt
  tar zxf /mnt/VMwareTools-*.tar.gz -C /tmp/
  umount /mnt
  rm /home/vagrant/linux.iso
  /tmp/vmware-tools-distrib/vmware-install.pl -d
# Enable auto kmod building
  echo "answer AUTO_KMODS_ENABLED yes" >> /etc/vmware-tools/locations
else
  exit 0
fi
