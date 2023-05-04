## Web Site Generator (DevOps)

Project for Introduction to DevOps

## Prerequisites

- Go Hugo v0.84.0
- GNU Make in version 3.81+
- Git (command line) in version 2+
- Ubuntu 18.04 system
- A text editor or IDE

## Lifecycle

- make build:  
  Generate the website from the markdown and configuration files in the directory dist/.
- make clean:  
  Cleanup the content of the directory dist/
- make post:  
  Create a new blog post whose filename and title come from the environment variables POST_TITLE and POST_NAME.
- make help:  
  Show this help.
