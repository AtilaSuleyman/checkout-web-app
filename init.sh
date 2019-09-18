#!/usr/bin/env bash
sudo yum -y install git
git --version
git clone https://github.com/AtilaSuleyman/checkout-web-app.git
sudo yum -y install docker
sudo service docker start
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-Linux-x86_64" -o /usr/bin/docker-compose -k
sleep 10
sudo chmod +x /usr/bin/docker-compose
cd checkout-web-app
docker-compose up -d
curl localhost
