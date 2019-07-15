#!/bin/bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo apt update -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update -y
sudo apt install docker-ce -y
sudo apt update -y
sudo apt install jq -y

# Authenticate token
curl  --header "Authorization: Bearer $1" --header "Content-Type: application/json"  --header "Accept: application/json" -X POST http://1f64b534.ngrok.io/download-peer | jq -r '.data' | base64 --decode > ./xooa-peer.zip

# Extract peer zip and then run it
apt-get install -y unzip
unzip xooa-peer.zip -d xooa-peer -o
cd xooa-peer
docker-compose up -d
