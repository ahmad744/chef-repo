#
# Cookbook Name:: Ta7leel
# Recipe:: database
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


# Configure the MySQL client.
mysql_client 'default' do
  action :create
end

# Configure the MySQL service.
mysql_service 'default' do
  initial_root_password node['Ta7leel']['database']['root_password']
  action [:create, :start]
end

# Install the mysql2 Ruby gem.
mysql2_chef_gem 'default' do
  action :install
end

# Create the database instance.
mysql_database node['Ta7leel']['database']['dbname'] do
  connection(
    :host => node['Ta7leel']['database']['host'],
    :username => node['Ta7leel']['database']['root_username'],
    :password => node['Ta7leel']['database']['root_password']
  )
  action :create
end

# Add a database user.
mysql_database_user node['Ta7leel']['database']['admin_username'] do
  connection(
    :host => node['Ta7leel']['database']['host'],
    :username => node['Ta7leel']['database']['root_username'],
    :password => node['Ta7leel']['database']['root_password']
  )
  password node['Ta7leel']['database']['admin_password']
  database_name node['Ta7leel']['database']['dbname']
  host node['Ta7leel']['database']['host']
  action [:create, :grant]
end

# Create a path to the SQL file in the Chef cache.
create_tables_script_path = File.join(Chef::Config[:file_cache_path], 'create-tables.sql')

# Write schema seed file to filesystem.
cookbook_file create_tables_script_path do
  source 'create-tables.sql'
  owner 'root'
  group 'root'
  mode '0600'
end

# Seed the database with a table and test data.
execute "initialize #{node['Ta7leel']['database']['dbname']} database" do
  command "mysql -h #{node['Ta7leel']['database']['host']} -u #{node['Ta7leel']['database']['admin_username']} -p#{node['Ta7leel']['database']['admin_password']} -D #{node['Ta7leel']['database']['dbname']} < #{create_tables_script_path}"
  not_if  "mysql -h #{node['Ta7leel']['database']['host']} -u #{node['Ta7leel']['database']['admin_username']} -p#{node['Ta7leel']['database']['admin_password']} -D #{node['Ta7leel']['database']['dbname']} -e 'describe customers;'"
end
