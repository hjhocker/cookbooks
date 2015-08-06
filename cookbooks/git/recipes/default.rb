#
# Cookbook Name:: git
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

home = node['home']

package 'git' do
  action :install
end

template "#{home}/.gitconfig" do
  source 'gitconfig.erb'
  owner 'harrison'
  group 'harrison'
  mode '0644'
end
