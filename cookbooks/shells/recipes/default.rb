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

git '/home/harrison/.oh-my-zsh/' do
  repository "https://github.com/robbyrussell/oh-my-zsh.git"
  reference "master"
  action :sync
end

git '/root/.oh-my-zsh/' do
  repository "https://github.com/robbyrussell/oh-my-zsh.git"
  reference "master"
  action :sync
end

template '/home/harrison/.oh-my-zsh/themes/robbyrussell.zsh-theme' do
  source 'robbyrussell.zsh-theme.erb'
  owner 'harrison'
  group 'harrison'
  mode '0644'
end

template '/root/.oh-my-zsh/themes/robbyrussell.zsh-theme' do
  source 'robbyrussell.zsh-theme.erb'
  owner 'harrison'
  group 'harrison'
  mode '0644'
end

template '/home/harrison/.zshrc' do
  source 'zshrc.erb'
  owner 'harrison'
  group 'harrison'
  mode '0644'
end

execute 'change-shell-to-zsh' do
  command 'chsh -s /bin/zsh && env zsh'
end

execute 'change-root-to-zsh' do
  command 'sudo -i && chsh -s /bin/zsh'
end
