#!/bin/bash

PLATFORM=ubuntu
PLATFORM_VERSION=14.10
MACHINE_ARCH=x86_64

curl -L -O "http://www.chef.io/chef/download-server?p=$PLATFORM&pv=$PLATFORM_VERSION&m=$MACHINE_ARCH&v=latest&prerelease=false"

exit 0
