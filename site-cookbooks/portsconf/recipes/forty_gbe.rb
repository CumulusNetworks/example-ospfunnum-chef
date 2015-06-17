#
# Cookbook Name:: portsconf
# Recipe:: default
#
# Copyright 2015, Cumulus Networks
#
# All rights reserved - Do Not Redistribute
#

cumulus_ports 'workbench' do
  speed_4_by_10g ['swp1', 'swp32']
  speed_40g ['swp2-31']
  notifies :restart, "service[switchd]"
end
