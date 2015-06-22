#!/bin/bash
yum -y clean all
rm -rf /tmp/*
rm -rf /var/tmp/*
if [ "$PACKER_BUILDER_TYPE" == "virtualbox-iso" || "$PACKER_BUILDER_TYPE" == "vmware-iso" ] ; then
  rm -rf /etc/udev/rules.d/70-persistent-net.rules
  rm -rf /etc/udev/rules.d/70-persistent-cd.rules
  rm -rf /lib/udev/rules.d/75-persistent-net-generator.rules
  rm -rf /dev/.udev/
  /bin/sed -i '/^\(HWADDR\|UUID\)=/d' /etc/sysconfig/network-scripts/ifcfg-eth0
else
  exit 0
fi
