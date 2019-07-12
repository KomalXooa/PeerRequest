#!/bin/bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo apt update -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update -y
sudo apt install docker-ce -y
sudo apt install nodejs -y
sudo apt install npm -y
sudo npm init -y
sudo npm install express -y
sudo npm install shelljs -y
sudo apt-get install git-core
sudo git clone https://github.com/Xooa/external_peer_cloud_backend.git external_peer
cd external_peer
cd backend
sudo npm install --save
sudo nohup node new_server.js &
cd ..
cd frontend
sudo npm install --save
sudo npm start Y
