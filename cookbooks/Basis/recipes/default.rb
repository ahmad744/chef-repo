#
# Cookbook Name:: Basis
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'selinux::permissive'
include_recipe 'Basis::firewall'
include_recipe 'Basis::web_user'
include_recipe 'Basis::web'
include_recipe 'Basis::database'