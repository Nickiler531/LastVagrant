#!/usr/bin/env bash

sudo add-apt-repository ppa:vbernat/haproxy-1.7
sudo apt-get update
sudo apt-get install -y haproxy
sudo cp /tmp/mastercfg/haproxy.cfg /etc/haproxy/haproxy.cfg
sudo systemctl restart haproxy
