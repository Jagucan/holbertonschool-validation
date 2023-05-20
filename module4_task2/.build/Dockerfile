FROM golang:1.16

RUN set -eux; \
    apt-get update && apt-get upgrade -y; \
    apt-get install -y wget make dpkg; \
    wget -q -O hugo_binary.deb https://github.com/gohugoio/hugo/releases/download/v0.111.3/hugo_extended_0.111.3_linux-amd64.deb; \
    dpkg -i hugo_binary.deb; \
    rm hugo_binary.deb; \
    curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b "$(go env GOPATH)/bin"; \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash -; \
    apt-get install -y nodejs; \
    npm install -g markdown-link-check markdownlint-cli; \
    apt-get install -y zip; \
    rm -rf /var/lib/apt/lists/*

SHELL ["/bin/bash", "-o", "pipefail"]

CMD ["/bin/bash"]
