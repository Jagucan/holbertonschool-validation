build:	## Generate the website
	make lint
	go get github.com/gorilla/mux
	go build

run:	## run the application
	./awesome-api >./awesome-api.log 2>&1 &

stop:	## stop the application
	kill "$(shell pgrep awesome-api)"

clean:	## Clean content
	- make stop
	- rm ./awesome-api ./awesome-api.log ./coverage-units.out 

test: ## test the application
	make unit-tests
	make integration-tests

lint: ## Static linting on go files using golangci-lint
	@golangci-lint run

unit-tests: ## execute unit tests:
	@go test -v -short -coverprofile=coverage-units.out	

integration-tests: ## execute integration tests
	@go test -v -coverprofile=coverage-integrations.out

help: ## Show help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
