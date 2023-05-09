build:	## compile the source code of the application to a binary named awesome-api
	make lint
	go get github.com/gorilla/mux
	go build

run:	## run the application in background by executing the binary awesome-api
	./awesome-api >./awesome-api.log 2>&1 &

stop:	## stop the application with the command kill XXXXX where XXXXX is the Process ID of the application. 
	kill "$(shell pgrep awesome-api)"

clean:	## Stop the application. Delete the binary awesome-api and the log file awesome-api.log
	- make stop
	- rm ./awesome-api ./awesome-api.log ./coverage-units.out

test:	## test the application
	make unit-tests
	make integration-tests

lint:	## static linting on go files
	@golangci-lint run

unit-tests:	## unit tests
	@go test -v -short -coverprofile=coverage-units.out

integration-tests:	## integration tests
	@go test -v -coverprofile=coverage-integrations.out

help:	## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'