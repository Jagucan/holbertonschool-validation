# hadolint global ignore=DL3007,DL3004,DL3008,DL3008,DL3009,DL3015,DL4006,SC2046,DL4001,DL3016,DL3018,DL4006,DL4001
# Stage 1: Golang
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


# Stage 2: Alpine
FROM alpine:3.13

# Install dependencies
RUN apk update && apk upgrade \
    && apk add --no-cache wget make curl jq nodejs npm \
    && wget -q -O /tmp/hugo_binary.deb https://github.com/gohugoio/hugo/releases/download/v0.111.3/hugo_extended_0.111.3_linux-amd64.deb \
    && dpkg -i /tmp/hugo_binary.deb \
    && rm /tmp/hugo_binary.deb \
    && curl -sfL https://install.goreleaser.com/github.com/golangci/golangci-lint.sh | sh -s -- -b /usr/local/bin v1.42.1 \
    && npm install -g markdown-link-check markdownlint-cli

# Set the working directory
WORKDIR /app

# Copy the artifacts
COPY ./dist /app

# Define the entrypoint
CMD ["hugo", "serve", "--bind", "0.0.0.0"]
