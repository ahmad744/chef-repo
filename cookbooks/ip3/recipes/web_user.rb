#
# Cookbook Name:: ip3
# Recipe:: web_user
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

group node['ip3']['group']

user node['ip3']['user'] do
  group node['ip3']['group']
  system true
  shell '/bin/bash'
end