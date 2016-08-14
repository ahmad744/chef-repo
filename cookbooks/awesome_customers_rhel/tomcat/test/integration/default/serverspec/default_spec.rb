require 'spec_helper'

describe 'tomcat::default' do
  describe command ('curl http://localhost:8080') do
    its (:stdout) { should match / Tomcat/ }
  end
  describe package ('yum install java-1.8.0-openjdk') do
    it { should be_installed }
  end
  
  describe group ('tomcat') do
    it { should exist }
end

describe user ('user') do
    it { should exist }
    it { should belong_to_group 'tomcat'}
    it { should have_home_directory '/opt/tomcat'}
  end

describe file('/opt/tomcat') do
  it { should exist }
  it { should be_directory }
  end
  
  describe file ('/opt/tomcat/conf') do
    it { should exist }
    it { should be_mode 70 }
  end
  
  %w[ webapps work temp logs ].each do |path|
  describe file("/opt/tomcat/#{path}") do
  it { should exist }
  it { should be_owned_by 'tomcat'}
  end
  
  
  
  
end