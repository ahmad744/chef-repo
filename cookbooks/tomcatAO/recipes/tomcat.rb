#
# Cookbook Name:: tomcatAO
# Recipe:: tomcat
#
# Copyright (c) 2016 The Authors, All Rights Reserved.



group 'tomcat'
user 'tomcat' do
    manage_home false
    shell '/bin/nologin'
    group 'tomcat'
    home '/opt/tomcat'
end

directory '/opt/tomcat' do
    action :create
    group 'tomcat'
end


remote_file 'apache-tomcat-8.0.36.tar.gz' do
    source 'http://apache.mirror.anlx.net/tomcat/tomcat-8/v8.0.36/bin/apache-tomcat-8.0.36.tar.gz'
end


execute 'tar xvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1'

execute 'chgrp -R tomcat /opt/tomcat/conf'

directory '/opt/tomcat/conf' do
mode '0070' 
end

execute 'chmod g+rwx /opt/tomcat/conf'

execute 'chmod g+r /opt/tomcat/conf/*'

execute 'chown -R tomcat /opt/tomcat/webapps/ /opt/tomcat/work/ /opt/tomcat/temp/ /opt/tomcat/logs/'

template '/etc/systemd/system/tomcat.service' do
   source 'tomcat.service.erb'
end

execute 'systemctl daemon-reload'

service 'tomcat' do
    action [:start ]
end

service 'tomcat' do
    action [:enable ]
end