#
# Cookbook Name:: Basis
# Recipe:: web
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Install Apache and start the service.
httpd_service 'customers' do
  mpm 'prefork'
  action [:create, :start]
end

# Add the site configuration.
httpd_config 'customers' do
  instance 'customers'
  source 'customers.conf.erb'
  notifies :restart, 'httpd_service[customers]'
end

# Create the document root directory.
directory node['Basis']['doc_root'] do
  recursive true
end

# Write the home page.
template "#{node['Basis']['doc_root']}/index.php" do
  source 'index.php.erb'
  mode '0644'
  owner node['Basis']['user']
  group node['Basis']['group']
end

# Install the mod_php Apache module.
httpd_module 'php' do
  instance 'customers'
end

# Install php-mysql.
package 'php-mysql' do
  action :install
  notifies :restart, 'httpd_service[customers]'
end