#
# Cookbook Name:: Basis
# Recipe:: web_user
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


group node['Basis']['group']

user node['Basis']['user'] do
  group node['Basis']['group']
  system true
  shell '/bin/bash'
end