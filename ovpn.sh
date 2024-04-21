#!/bin/bash
sudo apt-get update -y
sudo apt upgrade -y

#installing dependancies
sudo apt install ca-certificates wget net-tools gnupg -y

#add an OpenVPN server to your repository list

sudo wget https://as-repository.openvpn.net/as-repo-public.asc -qO /etc/apt/trusted.gpg.d/as-repository.asc

sudo echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/as-repository.asc] http://as-repository.openvpn.net/as/debian jammy main">/etc/apt/sources.list.d/openvpn-as-repo.list

sudo apt update && apt -y install openvpn-as