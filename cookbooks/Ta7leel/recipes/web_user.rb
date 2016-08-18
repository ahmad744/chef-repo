#
# Cookbook Name:: Ta7leel
# Recipe:: web_user
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


group node['Ta7leel']['group']

user node['Ta7leel']['user'] do
  group node['Ta7leel']['group']
  system true
  shell '/bin/bash'
end