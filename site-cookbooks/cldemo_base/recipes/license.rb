#
# Cookbook Name:: cldemo_base
# Recipe:: license
#
# Copyright 2014, Cumulus Networks
#

cumulus_license "#{node['hostname']}" do
  source "http://192.168.0.1/#{node['hostname']}.lic"
  notifies :restart, "service[switchd]"
end
