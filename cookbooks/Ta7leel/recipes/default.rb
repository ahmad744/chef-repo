#
# Cookbook Name:: Ta7leel
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


include_recipe "java::#{node['java']['install_flavor']}"
include_recipe 'Ta7leel::tomcat'
include_recipe 'selinux::permissive'
#include_recipe 'Ta7leel::firewall'
include_recipe 'Ta7leel::web_user'
include_recipe 'Ta7leel::web'
include_recipe 'Ta7leel::database'

