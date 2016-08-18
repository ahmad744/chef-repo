#
# Cookbook Name:: tomcatAO
# Recipe:: JDK
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


#not work 
#package 'yum install java-1.8.0-openjdk'
# work but don't install
#remote_file 'jdk-8u112-ea-bin-b04-linux-x64-25_jul_2016.tar.gz' do
   # source 'http://www.java.net/download/java/jdk8u112/archive/b04/binaries/jdk-8u112-ea-bin-b04-linux-x64-25_jul_2016.tar.gz'
#end
#execute 'tar xvf jdk-8u112-ea-bin-b04-linux-x64-25_jul_2016.tar.gz -C /opt --strip-components=1'

#execute 'yum update' do
  #command 'yum update - y'
 #end
 
 #execute 'java-1.8.0-openjdk' do
  #command 'yum install java-1.8.0-openjdk'
#end

#execute 'java-1.7.0-openjdk-devel' do
  #command 'yum install java-1.7.0-openjdk-devel'
#end
########################################################
# install openjdk8 
   #java "jdk" do
   #url 'http://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u92-b14.tar.bz2'
    #checksum  '226f9051e34b70fbff031ec9d959773d'
    #app_home '/usr/local/java/default'
    #bin_cmds ["java", "javac"]
    #action :install
    #end

# set alternatives for java and javac commands
#java_alternatives "set java alternatives" do
  #  java_location '/usr/local/java'
   # bin_cmds ["java", "javac"]
    #action :set
#end
 
#######################
