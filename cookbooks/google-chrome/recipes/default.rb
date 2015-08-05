#
# Cookbook Name:: google-chrome
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

file '/etc/apt/sources.list.d/google_chome.list' do
  content 'deb http://dl.google.com/linux/deb/ stable non-free main'
  mode '0744'
  owner 'root'
  group 'root'
end

execute 'add-google-chrome-key' do
  command 'wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -'
end

execute 'install-chrome' do
  command 'cd /tmp/ && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo gdebi google-chrome-stable_current_i386.deb'
end 
