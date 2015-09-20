#
# Cookbook Name:: vim
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'vim' do
	action :install
end

directory "#{node['home']}/.vim" do
	action :create
	owner "#{node['user']}"
	mode "0744"
end

directory "#{node['home']}/.vim/bundle" do
	action :create
	owner "#{node['user']}"
	mode "0744"
end

directory "#{node['home']}/.vim/autoload" do
	action :create
	owner "#{node['user']}"
	mode "0744"
end

template "#{node['home']}/.vim/autoload/pathogen.vim" do
	source 'pathogen.vim.erb'
	owner "#{node['user']}"
	group "#{node['user']}"
	mode '0744'
end

template "#{node['home']}/.vimrc" do
	source "vimrc.erb"
	owner "#{node['user']}"
	group "#{node['user']}"
	mode '0655'
end

git "#{node['home']}/.vim/bundle/nerdtree" do
	repository 'https://github.com/scrooloose/nerdtree.git'
	revision 'master'
	action :sync
end

git "#{node['home']}/.vim/bundle/vim-airline" do
	repository 'https://github.com/bling/vim-airline'
	revision 'master'
	action :sync
end

git "#{node['home']}/.vim/bundle/vim-fugitive" do
	repository 'git://github.com/tpope/vim-fugitive.git'
	revision 'master'
	action :sync
end

git "#{node['home']}/.vim/bundle/vim-nerdtree-tabs" do
	repository 'https://github.com/jistr/vim-nerdtree-tabs.git'
	revision 'master'
	action :sync
end


