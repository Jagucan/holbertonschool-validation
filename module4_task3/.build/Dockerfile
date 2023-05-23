FROM alpine:3.13

RUN apk update \
&& apk upgrade \
&& apk add --no-cache wget make curl jq nodejs npm \
&& wget -q -O /tmp/hugo_binary.deb https://github.com/gohugoio/hugo/releases/download/v0.111.3/hugo_extended_0.111.3_linux-amd64.deb \
&& dpkg -i /tmp/hugo_binary.deb \
&& rm /tmp/hugo_binary.deb \
&& curl -sfL https://install.goreleaser.com/github.com/golangci/golangci-lint.sh | sh -s -- -b /usr/local/bin v1.42.1 \
&& npm install -g markdown-link-check markdownlint-cli

WORKDIR /app

COPY ./dist /app

CMD ["hugo", "serve", "--bind", "0.0.0.0"]
