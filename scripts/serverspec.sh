#!/bin/bash
export PATH=$PATH:/opt/chef/embedded/bin/
gem install serverspec
cd /tmp/serverspec
rake spec
/bin/rm -rf /tmp/serverspec
