#
# Cookbook Name:: git
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

git 'clone-oh-my-zsh' do
  repository "https://github.com/robbyrussell/oh-my-zsh.git"
  action :sync
end
