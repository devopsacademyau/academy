# Webservers (c03-docker02)

Create two docker images, being: 
- Named `exercise02` with a tag `v1` with the following pre-requisites:
    - Dockerfile must be named Dockerfile.v1
    - Final image is based from httpd:2.4.41-alpine
    - Copy the file classes/03class/docker/artifacts/c03-docker02/index.html into the folder /usr/local/apache2/htdocs/
- Named `exercise02` with a tag `v2` with the following pre-requisites
    - Dockerfile must be named Dockerfile.v2
    - Final image is based from httpd:2.4.41-alpine
    - The folder /usr/local/apache2/htdocs/ must be empty

Run a container using the exercise02:v1 image exposing the container port(80) to yout localhost port 8081. You should be able to access the webserver throught http://localhost8081

Run a second container using the exercise02:v2 image exposing the container port(80) to your localhost port 8082. Additionaly, map the folder `classes/03class/docker/artifacts/c03-docker02/` of this repo into the folder `/usr/local/apache2/htdocs/` of the container during it's execution. You should be able to access the webserver throught http://localhost8082

You should have a similar behaviour when accessing both containers. You can use the command `curl http://localhost:8081` and `curl http://localhost:8082` to access the page being served by the containers.

Now change the content of the file classes/03class/docker/artifacts/c03-docker02/index.html, and without stoping the running containers, check if anything changed when accessing both URLs again.

## Submit a PR with the following files:
- README.md based on the [ANSWER.md file](ANSWER.md) with a link to the following files from your answer:
  - Dockerfile.v1: used to create the first image
  - Dockerfile.v2: used to create the second image
