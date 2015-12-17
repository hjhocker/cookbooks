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
  #Manage Ubuntu specific package
  when 'ubuntu'
    ['unace', 'unrar', 'zip', 'unzip', 'p7zip-full', 'p7zip-rar', 'sharutils', 'rar', 'uudeview', 'mpack',\
       'arj', 'cabextract', 'file-roller', 'wine', 'winetricks', 'qbittorrent', 'pidgin', 'skype', 'qbittorrent', \
       'ffmpeg', 'vlc', 'synaptic', 'gimp', 'unity-tweak-tool', 'tmux', 'ngrep', 'tig', 'tree', 'nodejs-legacy', \
       'npm', 'youtube-dl', 'htop', 'gradle', 'maven', 'ipcalc', 'vagrant', 'mplayer', 'gdebi-core', 'vim', 'curl', \
       'wget', 'g++'].each do |pkg|
      package pkg do
        action :install
      end
    end
    ['docker.io'].each do |pkg|
      package pkg do
        action :remove
      end
  end
  #End manage Ubuntu specific package
end


case node[:platform]
when 'ubuntu', 'centos', 'debian', 'rhel', 'redhat', 'fedora'
  utilities_add_user_to_group "add #{user} to #{group} group" do
    action :create
    username "#{user}"
    groupname "#{group}"
  end
end

utilities_node_config_manager "key" do
  action :create
  value "key"
end

utilities_node_config_manager "yoda" do
  action :create
  username node['user']
  value "taco"
end

utilities_node_config_manager "key" do
  action :delete
end

utilities_node_config_manager "hahahaha" do
  action :delete
end

utilities_node_config_manager "yoda" do
  action :delete
end
