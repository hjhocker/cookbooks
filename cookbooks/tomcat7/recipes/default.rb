#
# Cookbook Name:: tomcat7
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

user = Dir.home.split("/")[ Dir.home.split("/").size-1 ]

package 'tomcat7' do
  action :install
end

directory '/var/lib/tomcat7/webapps/' do
  action :create
  owner "#{user}"
  group "#{user}"
  mode  '0766'
end
