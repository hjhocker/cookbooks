#
# Cookbook Name:: utilities
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

user = node['user']
home = node['home']
group = node['group']

['tmux', 'ngrep', 'tig', 'tree', 'nodejs-legacy', 'npm', 'youtube-dl', 'htop', 'gradle', 'maven', 'ipcalc', 'vagrant', 'mplayer', 'gdebi-core', 'vim', 'curl', 'wget', 'g++'].each do |pkg|
  package pkg do
    action :install
  end
end

['docker.io'].each do |pkg|
  package pkg do
    action :remove
  end
end

utilities_add_user_to_group "add #{user} to #{group} group" do
  action :create
  username "#{user}"
  groupname "#{group}"
end
