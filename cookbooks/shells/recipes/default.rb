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

execute 'change-default-shell-to-zsh' do
  command 'chsh -s /bin/zsh'
end

package 'git' do
  action :install
end

directory '/home/vagrant/.oh-my-zsh' do
  owner 'vagrant'
  group 'vagrant'
  mode '0755'
  action :create
end

#execute 'install-oh-my-zsh' do
#  command 'sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
#end

ENV['ZSH'] = "/home/vagrant/.oh-my-zsh"

file "/home/vagrant/.zshrc" do
  owner 'root'
  group 'root'
  mode 0755
  content ::File.open("/home/vagrant/.oh-my-zsh/templates/zshrc.zsh-template").read
  action :create
end
