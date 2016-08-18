#
# Cookbook Name:: myfirstcookbook
# Recipe:: yum_update
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

execute 'yum_update' do
  command 'yum update -y'
end