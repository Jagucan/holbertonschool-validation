#!/bin/bash
apt update && apt upgrade -y
apt install -y wget make dpkg
wget https://github.com/gohugoio/hugo/releases/download/v0.84.0/hugo_0.84.0_Linux-64bit.deb
dpkg -i hugo_0.84.0_Linux-64bit.deb
rm hugo_0.84.0_Linux-64bit.deb
make build
