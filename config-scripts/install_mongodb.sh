#!/bin/bash
sudo apt update
sudo apt install mongodb -y
sudo systemctl enable mongod
sudo systemctl start mongodb
