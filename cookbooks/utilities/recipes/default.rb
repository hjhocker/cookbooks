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

execute 'add-user-to-docker-group' do
  command "usermod -a -G docker #{user}"
end
