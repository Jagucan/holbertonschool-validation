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
		- rm ./awesome-api ./awesome-api.log

test:	## test the application
		curl http://localhost:9999
		curl http://localhost:9999/health

lint:	## static linting on go files
		golangci-lint run

help:	## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'