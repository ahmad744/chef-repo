#
# Cookbook Name:: mythiredcookbook
# Recipe:: yum
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


execute 'yum' do
  command 'yum update -y'
end