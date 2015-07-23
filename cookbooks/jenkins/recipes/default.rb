#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apt'

apt_repository 'jenkins' do
  uri 'http://pkg.jenkins-ci.org/debian'
  key 'https://jenkins-ci.org/debian/jenkins-ci.org.key'
  action :add
end

