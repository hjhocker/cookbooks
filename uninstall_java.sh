#!/bin/bash

sudo apt-get update
apt-cache search java | awk '{print($1)}' | grep -E -e '^(ia32-)?(sun|oracle)-java' -e '^openjdk-' -e '^icedtea' -e '^(default|gcj)-j(re|dk)' -e '^gcj-(.*)-j(re|dk)' -e 'java-common' | xargs sudo apt-get -y remove
sudo apt-get -y autoremove
dpkg -l | grep ^rc | awk '{print($2)}' | xargs sudo apt-get -y purge
sudo bash -c 'ls -d /home/*/.java' | xargs sudo rm -rf
sudo rm -rf /usr/lib/jvm/*

exit 0
