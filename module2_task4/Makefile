build: ## Generate the website
	make check
	hugo

clean: ## Clean content
	-rm -rf ./dist
	-make stop
	-rm ./awesome-api ./awesome-api.log ./coverage-units.out 

post: ## Create a new blog post
	hugo new posts/${POST_NAME}.md
	sed -i 's/^title:.*/title: ${POST_TITLE}/g' ./content/posts/${POST_NAME}.md

run: ## Run the application
	./awesome-api >./awesome-api.log 2>&1 &

stop: ## stop the application
	kill "$(shell pgrep awesome-api)"

test: ## test the app
	make unit-tests
	make integration-tests

lint: ## Static linting on go files using golangci-lint
	@golangci-lint run

unit-tests: ## execute unit tests
	@go test -v -short -coverprofile=coverage-units.out     

integration-tests: ## execute integration tests
	@go test -v -coverprofile=coverage-integrations.out

check: ## Markdown linting on syntax and dead links
	markdown-link-check ./content/posts/*
	markdownlint ./content/posts/*


validate: ## validate using W3C Validator
	- ./w3c_validator.py ./dist/index.html

help: ## Show help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
