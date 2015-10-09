#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'nginx' do
  action :install
end

template '/etc/nginx/nginx.conf' do
	source 'nginx.conf.erb'
	mode 0644
	owner 'root'
	group 'root'
end

service 'nginx' do
	action :start
end
