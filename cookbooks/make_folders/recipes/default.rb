#
# Cookbook Name:: make_folders
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

foldername = node['foldername']
folderpath = node['folderpath']
user = node["username"]
fullpath = "#{folderpath}/#{foldername}"

puts "pathhhhhhhhhhhhhhhhh #{folderpath}"
puts "nameEeeeeeeeeeeeeee  #{foldername}"
directory fullpath do
  owner "#{user}"
  group "#{user}"
  mode "0755"
end
