# Deploy FAQ

## What is in the archive and how to unarchive it?

The archive contains the files needed to deploy the awesome website. Unarchive it by running the command unzip awesome-website.zip.

## What are the commands to start and stop the application?

To start the application, run the command `make run`. To stop the application, press `Ctrl + C` in the terminal.

## How to customize where the application logs are written?

You can customize the log file name by changing the `LOG_FILE` variable in the Makefile.

## How to "quickly" verify that the application is running (healthcheck)?

You can run `make test` or use a curl command from the terminal to send a request to localhost and check that the response is valid.

## How to perform lint checks?

To perform lint checks, use the command `make lint`. This will check the code for any formatting or syntax errors.
