#
# Cookbook Name:: tomcatAO
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


############################
include_recipe "java::#{node['java']['install_flavor']}"
############################
#include_recipe "java"
#include_recipe "tomcatAO::JDK"
include_recipe 'tomcatAO::tomcat'
