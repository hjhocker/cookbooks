#
# Cookbook Name:: shells
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

home = node['home']
user = Dir.home.split("/")[ Dir.home.split("/").size-1 ]

package 'zsh' do
  action :install
end

package 'git' do
  action :install
end

git "#{home}/.oh-my-zsh/" do
  repository "https://github.com/robbyrussell/oh-my-zsh.git"
  reference "master"
  action :sync
end

git '/root/.oh-my-zsh/' do
  repository "https://github.com/robbyrussell/oh-my-zsh.git"
  reference "master"
  action :sync
end

template "#{home}/.oh-my-zsh/themes/robbyrussell.zsh-theme" do
  source 'robbyrussell.zsh-theme.erb'
  owner "#{user}"
  group "#{user}"
  mode '0644'
end

template '/root/.oh-my-zsh/themes/robbyrussell.zsh-theme' do
  source 'robbyrussell.zsh-theme.erb'
  owner 'root'
  group 'root'
  mode '0644'
end

template "#{home}/.zshrc" do
  source 'zshrc.erb'
  owner "#{user}"
  group "#{user}"
  mode '0777'
end

execute 'change-shell-to-zsh' do
  command 'chsh -s /bin/zsh && env zsh'
end

execute 'change-root-to-zsh' do
  command 'sudo -i && chsh -s /bin/zsh'
end
