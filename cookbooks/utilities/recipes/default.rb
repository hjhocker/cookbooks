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
  #Manage Ubuntu specific packagea
  when 'ubuntu'
    ['python-dev', 'python-pip', 'unace', 'unrar', 'zip', 'unzip', 'p7zip-full', 'p7zip-rar', 'sharutils', 'rar', 'uudeview', 'mpack',\
       'arj', 'cabextract', 'file-roller', 'wine', 'winetricks', 'qbittorrent', 'pidgin', 'skype', 'qbittorrent', \
       'ffmpeg', 'vlc', 'synaptic', 'gimp', 'unity-tweak-tool', 'tmux', 'ngrep', 'tig', 'tree', 'nodejs-legacy', \
       'npm', 'youtube-dl', 'htop', 'gradle', 'maven', 'ipcalc', 'vagrant', 'mplayer', 'gdebi-core', 'vim', 'curl', \
       'wget', 'g++', 'libfreetype6-dev'].each do |pkg|
      package pkg do
        action :install
      end
    end
    ['docker.io'].each do |pkg|
      package pkg do
        action :remove
      end
    utilities_install_pip "pip" do
      action :create
    end
    utilities_pip_install "numpy" do
      action :create
    end
    utilities_pip_install "scipy" do
      action :create
    end
    utilities_vagrant_plugins "berkshelf" do
      action :create
    end
    utilities_vagrant_plugins "vagrant-berkshelf" do
      action :create
    end
    utilities_vagrant_plugins "vagrant-proxyconf" do
      action :create
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

utilities_node_config_manager "yoda-master" do
  action :delete
  username node['user']
  value "taco"
end

utilities_node_config_manager "yoda" do
  action :create
  username node['user']
  value "yoda"
end

utilities_node_config_manager "yoda-master" do
  action :delete
  username node['user']
  value "taco"
end

utilities_install_pip "pip"
