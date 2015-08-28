#!/bin/bash

PLATFORM=ubuntu
PLATFORM_VERSION=14.10
MACHINE_ARCH=x86_64

curl -L -O https://web-dl.packagecloud.io/chef/stable/packages/ubuntu/trusty/chef-server-core_12.1.2-1_amd64.deb


curl -L -O "http://www.chef.io/chef/download-server?p=$PLATFORM&pv=$PLATFORM_VERSION&m=$MACHINE_ARCH&v=latest&prerelease=false"

exit 0
