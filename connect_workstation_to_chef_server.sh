#!/bin/bash

#This should match the FQDN of the Chef Server or the SSL certificates wont wont and the host wont be resolved properly
echo '104.238.136.190 vultr.guest' >> /etc/hosts

knife ssl fetch
knife client list

# Add this to bootstrap without ssl verification: --node-ssl-verify-mode none
knife bootstrap <IP_ADDRESS> -N bootstrap-test-node -x root -P <password> --sudo --use-sudo-password
