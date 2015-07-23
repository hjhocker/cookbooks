#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'

file '/etc/apt/sources.list.d/jenkins.list' do 
  mode '0777'
  owner 'vagrant'
  group 'vagrant'
  action :create
end

apt_repository 'jenkins' do
  uri 'http://pkg.jenkins-ci.org/debian'
  key 'https://jenkins-ci.org/debian/jenkins-ci.org.key'
  components ["binary/"]  
  action :add
end

package "jenkins"

service "jenkins" do
  supports [:stop, :start, :restart]
  action [:start, :enable]
end

