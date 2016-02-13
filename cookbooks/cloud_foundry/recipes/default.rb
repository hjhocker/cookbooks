#
# Cookbook Name:: cloud_foundry
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


package 'ruby-dev'

execute 'install bosh' do
  command 'gem install bosh_deployer'
  not_if 'gem list | grep bosh_deployer'
end

execute 'install bosh bootstrap' do
  command 'gem install bosh-bootstrap'
  not_if 'gem lsit | grep bootstrap'
end
