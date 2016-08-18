#
# Cookbook Name:: Ta7leel
# Recipe:: firewall
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


include_recipe 'firewall::default'

ports = node['Ta7leel']['open_ports']
firewall_rule "open ports #{ports}" do
  port ports
end

firewall 'default' do
  action :save
end