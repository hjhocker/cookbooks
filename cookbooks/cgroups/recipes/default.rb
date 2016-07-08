#
# Cookbook Name:: cgroups
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'cgroup-bin'

execute 'start cgmanager' do
  command 'service cgmanager start'
  not_if 'service cgmangager status | grep running'
end
