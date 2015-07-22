#
# Cookbook Name:: utilities
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

['vim', 'curl', 'wget', 'git'].each do |pkg|  
  package pkg do
    action :install
  end
end
