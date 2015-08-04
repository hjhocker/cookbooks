#
# Cookbook Name:: utilities
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

['vim', 'curl', 'wget', 'git', 'g++', 'ruby1.9.1', 'ruby1.9.1-dev', 'rubygems1.9.1', 'irb1.9.1', 'rdoc1.9.1', 'build-essential', 'libopenssl-ruby1.9.1', 'libssl-dev', 'zlib1g-dev'].each do |pkg|  
  package pkg do
    action :install
  end
end
