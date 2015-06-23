#!/bin/bash
if [ "$PACKER_BUILDER_TYPE" == "virtualbox-iso" ] ; then
  VBOX_VERSION=$(/bin/cat /home/vagrant/.vbox_version)
  cd /tmp
  /bin/mount -o loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
  /bin/sh /mnt/VBoxLinuxAdditions.run
  /bin/umount /mnt
  /bin/rm -rf /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso
elif [ "$PACKER_BUILDER_TYPE" == "vmware-iso" ] ; then
  /usr/bin/yum -y install fuse-libs
  /bin/mount -t iso9660 -o loop /home/vagrant/linux.iso /mnt
  /bin/tar zxf /mnt/VMwareTools-*.tar.gz -C /tmp/
  /bin/umount /mnt
  /bin/rm /home/vagrant/linux.iso
  /tmp/vmware-tools-distrib/vmware-install.pl -d
# Enable auto kmod building
  /bin/echo "answer AUTO_KMODS_ENABLED yes" >> /etc/vmware-tools/locations
else
  exit 0
fi
