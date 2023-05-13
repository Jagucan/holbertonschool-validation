# Golang Project

## prerequisites

- Golang in v1.15.\*
- NPM v7+ with NodeJS v14.\* (stable)
- Python 3 with pip module
- golangci-lint

## Lifecycle

- build: compile the source code of the application to a binary named awesome-api
- run: run the application in background by executing the binary awesome-api
- stop: stop the application with the command kill XXXXX where XXXXX is the Process ID of the application.
- clean: Stop the application. Delete the binary awesome-api and the log file awesome-api.log
- test: test the application
- lint: static linting on go files
- unit-tests: execute unit tests
- integration-tests: execute integration tests
- help: show the help