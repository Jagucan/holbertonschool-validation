#!/bin/bash
sudo apt-get update && apt-get upgrade -y
sudo apt install -y wget make dpkg curl
wget -O hugo_extended_0.111.3.deb https://github.com/gohugoio/hugo/releases/download/v0.111.3/hugo_extended_0.111.3_linux-amd64.deb
sudo dpkg -i hugo_extended_0.111.3.deb
rm hugo_extended_0.111.3.deb
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin 
export PATH=$PATH:/usr/local/go/bin
sudo npm install -g npm@9.6.7 && npm install -g markdownlint-cli && sudo npm install -g markdown-link-check
sudo apt-get install zip -y
