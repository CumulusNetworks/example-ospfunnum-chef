#
# Cookbook Name:: cldemo_base
# Recipe:: chef-client
#
# Copyright 2014, Cumulus Networks
#

interface_items = data_bag_item(:interfaces, node.name)

loopback = interface_items['loopback']
unnumbered = interface_items['unnumbered'] || []
layer3 = interface_items['layer3'] || []
bridges = interface_items['bridges'] || []

cumulus_interface 'lo:1' do
  ipv4 ["#{loopback['address']}/32"]
  notifies :restart, "service[networking]"
end

unnumbered.each do |intf|
  cumulus_interface intf do
    ipv4 ["#{loopback['address']}/32"]
    notifies :restart, "service[networking]"
  end
end

layer3.each do |intf|
  cumulus_interface intf['name'] do
    ipv4 ["#{intf['address']}/#{intf['netmask']}"]
    notifies :restart, "service[networking]"
  end
end

bridges.each do |intf|
  cumulus_bridge intf['name'] do
    ipv4 ["#{intf['address']}/#{intf['netmask']}"]
    ports intf['ports']
    notifies :restart, "service[networking]"
  end
end
