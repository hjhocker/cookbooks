#
# Cookbook Name:: git
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'git' do
  action :install
end

template '/home/harrison/.gitconfig' do
  source 'gitconfig.erb'
  owner 'harrison'
  group 'harrison'
  mode '0644'
end
