go-build: ## Generates the API binary from golang files
	@docker run --volume=$(shell pwd):/app --workdir=/app golang:latest go build

build-docker: ## Generates the right Docker image
	docker build -t awesome:build ./.build

hugo-build: ## Generates the static site using go hugo
	@@docker run --volume=$(shell pwd):/app --workdir=/app --rm awesome:build hugo

build: ## Generate the website
	@make check
	@make lint
	@make go-build
	@make hugo-build

clean: ## Clean content
	-@make stop
	-@rm -rf ./dist
	-@rm ./awesome-api ./awesome-api.log ./coverage-units.out 
 
post: ## Create a new blog post
	@docker run --volume=$(shell pwd):/app --workdir=/app --rm awesome:build hugo new posts/${POST_NAME}.md
	@sed -i 's/^title:.*/title: ${POST_TITLE}/g' ./content/posts/${POST_NAME}.md

run: ## Run the application
	@make build
	@./awesome-api >./awesome-api.log 2>&1 &

stop: ## Stop the application 
	@kill "$(shell pgrep awesome-api)"

test: ## test the application
	@make unit-tests
	@make integration-tests
	@make validate

lint: ## Static linting on go files using golangci-lint
	@make build-docker
	@docker run --rm -i hadolint/hadolint < ./.build/Dockerfile
	@docker run --volume=$(shell pwd):/app --workdir=/app --rm awesome:build markdownlint README.md DEPLOY.md

unit-tests: ## execute unit tests
	@docker run --volume=$(shell pwd):/app --workdir=/app --rm awesome:build go test -v -short -coverprofile=coverage-units.out

integration-tests: ## execute integration tests
	@docker run --volume=$(shell pwd):/app --workdir=/app --rm awesome:build go test -v -coverprofile=coverage-integrations.out

check: ## Markdown linting on syntax and dead links
	@docker run --volume=$(shell pwd):/app --workdir=/app --rm awesome:build markdown-link-check ./content/posts/*
	@docker run --volume=$(shell pwd):/app --workdir=/app --rm awesome:build markdownlint ./content/posts/*

validate: ## validate using W3C Validator
	@-w3c_validator.py ./dist/index.html

package: ## Creates an zip package
	@make build
	@zip awesome-website.zip awesome-api ./dist/

help: ## Show help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

docker-tests: ## execute docker tests to check an image create on docker
	@container-structure-test test --image awesome:build --config ./.build/cst.yml --output json | jq -r '[.pass,.fail,.duration] | "Passes:\t\(.[0])\nFailures:\t\(.[1])\nDuration:\t\(.[2])\nTotal tests:\t\(.[0]+.[1])"'
