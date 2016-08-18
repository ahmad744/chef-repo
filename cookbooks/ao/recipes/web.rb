#
# Cookbook Name:: ao
# Recipe:: web
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

package 'httpd'

service 'httpd' do
  action [:enable, :start]
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
end