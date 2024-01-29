#!/bin/bash
sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential mongodb git

ruby -v
bundler -v

sudo systemctl start mongodb
sudo systemctl enable mongod
systemctl status mongodb

cd ~/
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
puma -d
ps aux | grep puma
curl http://localhost:9292
