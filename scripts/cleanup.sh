#!/bin/bash
/usr/bin/yum -y clean all
/bin/rm -rf /tmp/*
/bin/rm -rf /var/tmp/*
if [ "$PACKER_BUILDER_TYPE" == "virtualbox-iso" ] || [ "$PACKER_BUILDER_TYPE" == "vmware-iso" ] || [ "$PACKER_BUILDER_TYPE" == "qemu" ] ; then
  /bin/rm -rf /etc/udev/rules.d/70-persistent-net.rules
  /bin/rm -rf /etc/udev/rules.d/70-persistent-cd.rules
  /bin/rm -rf /lib/udev/rules.d/75-persistent-net-generator.rules
  /bin/rm -rf /dev/.udev/
  /bin/sed -i '/^\(HWADDR\|UUID\)=/d' /etc/sysconfig/network-scripts/ifcfg-eth0
else
  exit 0
fi
