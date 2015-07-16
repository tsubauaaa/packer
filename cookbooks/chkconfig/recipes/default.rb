#
# Cookbook Name:: chkconfig
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
node['chkconfig']['on_services'].each do |service|
  bash "start_#{service}_service" do
    code <<-EOC
      /sbin/chkconfig #{service} on
    EOC
  only_if "/sbin/chkconfig --list | grep #{service} | grep 3:off"
  end
end

node['chkconfig']['off_services'].each do |service|
  bash "stop_#{service}_service" do
    code <<-EOC
      /sbin/chkconfig #{service} off
    EOC
  only_if "/sbin/chkconfig --list | grep #{service} | grep 3:on"
  end
end
