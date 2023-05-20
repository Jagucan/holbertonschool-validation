build: ## Generate the website
	@make check
	@make lint
	@go build
	@hugo

clean: ## Clean content
	-@make stop
	-@rm -rf ./dist
	-@rm ./awesome-api ./awesome-api.log ./coverage-units.out 

post: ## Create a new blog post
	@hugo new posts/${POST_NAME}.md
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
	@markdownlint README.md DEPLOY.md

unit-tests: ## execute unit tests
	@go test -v -short -coverprofile=coverage-units.out     

integration-tests: ## execute integration tests
	@go test -v -coverprofile=coverage-integrations.out

check: ## Markdown linting on syntax and dead links
	@markdown-link-check ./content/posts/*
	@markdownlint ./content/posts/*

validate: ## validate using W3C Validator
	@-./w3c_validator.py ./dist/index.html

package: ## Creates an zip package
	@make build
	@zip awesome-website.zip awesome-api ./dist/

help: ## Show help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
