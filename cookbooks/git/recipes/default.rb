#
# Cookbook Name:: git
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

home = node['home']
user = Dir.home.split("/")[2]

package 'git' do
  action :install
end

template "#{home}/.gitconfig" do
  source 'gitconfig.erb'
  owner "#{user}"
  group "#{user}"
  mode '0644'
end
