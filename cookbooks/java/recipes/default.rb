#
# Cookbook Name:: java
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "java::download"

['openjdk-8-jdk'].each do |pkg|
  package pkg do
    action :install
  end
end
