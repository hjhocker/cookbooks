#
# Cookbook Name:: utilities
# Recipe:: default
#
# Copyright 2015, Harrison Hocker
#
# All rights reserved - Do Not Redistribute
#

user = node['user']
home = node['home']
group = node['group']

case node[:platform]
  when 'ubuntu'
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
end


case node[:platform]
when 'ubuntu', 'centos', 'debian', 'rhel', 'redhat', 'fedora'
  utilities_add_user_to_group "add #{user} to #{group} group" do
    action :create
    username "#{user}"
    groupname "#{group}"
  end
end


utilities_node_config_manager "configure the node proxy" do
  action :create
  property "key"
  value "value"
end
