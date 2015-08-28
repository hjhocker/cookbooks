#!/bin/bash

#Without this nginx wont start: chef-server-ctl status && chef-server-ctl start
echo "$(ifconfig eth0 | grep 'inet addr:' | cut -d':' -f2 | cut -d' ' -f1) vultr.guest" >> /etc/hosts

./download_chefdk.sh

ufw enable
ufw allow 443/tcp
iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT

chef-server-ctl start


echo "Reconfigure chef server"
chef-server-ctl reconfigure
chef-server-ctl restart
sleep 5
echo "Create user harrisonhocker"
chef-server-ctl user-create harrisonhocker Harrison Hocker hjhocker@gmail.com <password> --filename /root/harrisonhocker.pem

chef-server-ctl org-create motobecane "Motobecane_Computing" --association_user harrisonhocker --filename /root/motobecane-validator.pem

chef-server-ctl install opscode-manage

chef-server-ctl reconfigure

opscode-manage-ctl reconfigure
