#
# Cookbook Name:: shells
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

home = node['home']
user = node['user']

puts "The platform is " + node['platform']

['zsh','git'].each do |pkg|
  package pkg do
    action :install
  end
end

shells_git_stash "#{home}/.oh-my-zsh" do
  action :create
  username node['user']
end

git "#{home}/.oh-my-zsh/" do
  repository "https://github.com/robbyrussell/oh-my-zsh.git"
  reference "master"
  action :sync
end

shells_git_pop "#{home}/.oh-my-zsh" do
  action :create
  username node['user']
end

shells_git_stash "#{home}/.oh-my-zsh" do
  action :create
  username node['user']
end

git '/root/.oh-my-zsh/' do
  repository "https://github.com/robbyrussell/oh-my-zsh.git"
  reference "master"
  action :sync
end

shells_git_pop "#{home}/.oh-my-zsh" do
  action :create
  username node['user']
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
  command "chsh -s /bin/zsh #{user} && env zsh"
end

execute 'change-root-to-zsh' do
  command 'sudo -i && chsh -s /bin/zsh root && env zsh'
end

directory "#{home}/bin/" do
  owner "#{user}"
  group "#{user}"
  mode  "0744"
  action :create
end
