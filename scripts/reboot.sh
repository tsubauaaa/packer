#!/bin/bash
if [ "$PACKER_BUILDER_TYPE" == "virtualbox-iso" ] ; then
  /sbin/reboot
  sleep 60
fi
