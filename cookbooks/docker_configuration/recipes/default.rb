#
# Cookbook Name:: docker_configuration
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

user = node['user']
home = node['home']

execute 'add-docker-key' do
  command 'sh -c "wget -qO- https://get.docker.io/gpg | apt-key add -"'
end

template '/etc/apt/sources.list.d/docker.list' do
  source 'docker.list.erb'
  owner 'root'
  mode '0644'
end

execute "apt-get-update" do
  command "apt-get update"
end

package 'lxc-docker-1.4.1' do
  action :install
end

execute 'add user to docker group' do
  command "usermod -a -G docker #{user}"
end

docker_image 'mongo' do
  tag 'latest'
  action :pull
end

docker_container 'my_mongo' do
  repo 'mongo'
  tag 'latest'
  port '27017:27017'
  hostname 'mongo-host'
  domain_name 'mongo.harrison.com'
end
