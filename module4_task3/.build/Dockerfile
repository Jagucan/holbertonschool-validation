# hadolint ignore=DL3007
FROM golang:latest

# Install dependencies
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y wget make dpkg curl sudo jq nodejs npm

# Install Hugo
RUN wget -q -O hugo_binary.deb https://github.com/gohugoio/hugo/releases/download/v0.111.3/hugo_extended_0.111.3_linux-amd64.deb \
    && dpkg -i hugo_binary.deb \
    && rm hugo_binary.deb

# Install golangci-lint
RUN curl -sfL https://install.goreleaser.com/github.com/golangci/golangci-lint.sh | sh -s -- -b /usr/local/bin v1.42.1

# Install markdown-link-check and markdownlint-cli
RUN npm install -g markdown-link-check markdownlint-cli

# Set the working directory
WORKDIR /app

# Copy the artifacts
COPY ./dist /app

# Define the entrypoint
CMD ["hugo", "serve", "--bind", "0.0.0.0"]
