#!/bin/sh
export server_host=localhost
export server_port=8080
git clone https://github.com/kschernopiatova/pymobiledevice3
cd pymobiledevice3 || exit
git checkout server
#create virtual env and install dependencies
python3 -m venv .venv
source .venv/bin/activate
python3 -m pip install -U -e .
sudo python3 ./pymobiledevice3/solvd/server.py $server_host $server_port &>/dev/null &