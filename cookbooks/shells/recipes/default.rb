#
# Cookbook Name:: shells
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'zsh' do
  action :install
end

package 'git' do
  action :install
end

execute 'change-shell' do
  command 'chsh -s /bin/zsh vagrant'
end

execute 'install-oh-my-zsh' do
  command 'sh -c "`curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh`"'
end
