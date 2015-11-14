#
# Cookbook Name:: custom_resource
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute

custom_resource_httpd 'index' do
    action :create
    html_content '<h1>Hello Chef</h1>'
end
