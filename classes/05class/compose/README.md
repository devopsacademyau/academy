# Docker Compose
This class is a general overview of the Docker Compose tool.
The main goal is to explain the purpose, the benefits and how to use it.

***Contents***
- [What is Docker Compose](#what-is-docker-compose)
- [Why use Docker Compose?](#why-use-docker-compose)
- [Compose File](#compose-file)
- [Running some code](#running-some-code)


## What is Docker Compose?
Compose is a tool for defining and running multiples docker containers that needs to interact between each other. It's a very popular tool for development as well as for CI workflows.

The Compose tool is used by creating a file called `docker.compose.yaml`, where all the containers will be defined. Once you have created this file, you can bring all containers running by execuring the command `docker-compose up`.

If you still don't have Docker Compose installed on your machine, you can follow the steps [here](https://docs.docker.com/compose/install/) to have it installed. 

## Why use Docker Compose?
Because the Compose tool makes easy to run multiple containers in the same machine, it helps a lot during the application development phase, since you can make changes to an application running on docker, and can easily test the new code integration with the existent environment. 

For example, you can have a Compose file defining a database service (like MySQL) and the application being developed. Whenever new code needs to be tested, Compose can be used used to run both services locally and the feedback from the code being developed can be gathered really quickly.

Another ver common usage of the Compose is during some integration tests of your CI pipeline. By suing docker-compose, you can start all your containers in your CI tool and run a set of tests to validate that all the components that your application is builded from are working correctly together. This is a very common and import step of any mature CI pipeline.

## Compose file
The docker-compose.yaml file is where all the definition that your docker-compose command use goes. By being a yaml file, its structure is easily undestandable.



## Appendix
- [Docker Compose - Getting Started](https://docs.docker.com/compose/gettingstarted/)
