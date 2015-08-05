#
# Cookbook Name:: utilities
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

['mplayer', 'gdebi-core', 'vim', 'curl', 'wget', 'git', 'g++', 'ruby1.9.1', 'ruby1.9.1-dev', 'rubygems1.9.1', 'irb1.9.1', 'rdoc1.9.1', 'build-essential', 'libopenssl-ruby1.9.1', 'libssl-dev', 'zlib1g-dev'].each do |pkg|  
  package pkg do
    action :install
  end
end

execute 'set-git-default-email' do
  command 'git config --global user.email "hjhocker@gmail.com"'
end

execute 'set-git-efault-name' do
  command 'git config --global user.name "Harrison Hocker"'
end

execute 'set-git-default-push' do
  command 'git config --global push.default matching'
end
