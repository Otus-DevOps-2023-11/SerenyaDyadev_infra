#!/bin/sh
wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list
apt update
sleep 1
apt install -y ruby-full ruby-bundler build-essential mongodb-org git
systemctl start mongod
systemctl enable mongod
cd /opt/
git clone -b monolith https://github.com/express42/reddit.git && cd reddit
bundle install
