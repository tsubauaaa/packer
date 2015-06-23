#!/bin/bash
if [ "$PACKER_BUILDER_TYPE" == "virtualbox-iso" ] ; then
  /sbin/reboot
  /bin/sleep 60
fi
