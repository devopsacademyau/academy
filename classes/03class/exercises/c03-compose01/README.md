# Basic Compose (c03-compose01)

In this exercise, you'll create a Docker Compose to run two images that will work together. One of the images will be a Apache WebServer with PHP and the other will be a MySQL Database.

In [this directory](../../compose/artifacts/c05-compose01/) you'll find the following files:
- In the `src` directory, there will be 2 .php files that will be used by the PHP WebServer
- In the root directory there will be a Dockerfile that will be used to create the image to be used by the PHP Webserver

You'll need to create a `docker-compose.yaml` file that will have two services:
- Database Service
    - Name: db
    - Image: mysql:5.7
    - Use the information from [here](https://hub.docker.com/_/mysql) to configure this service
- Web Service
    - Name: web
    - Port: 8100
    - Environment variables:
        - DB_USER (Username for the database connection)
        - DB_PASS (Password for the database connection)
        - DB_HOST (DB Hostname for the database connection)
        - DB (DB instance for the database connection)
    - The `src` folder content must be mounted as a volume in the folder `/var/www/html/`
    - Image to be used is the one from the Dockerfile provided and it should be build during the `docker-compose up` command execution

To check if everything is working, once both containers are running you should get the following response `Connected Successfully` when accessing `http://localhost:8100`.


## Submit a PR with the following files:
- README.md based on the [ANSWER.md file](ANSWER.md) with a link to the following files from your answer:
    - docker-compose.yaml
        - with both `web` and `db` services configured
        - commands executed and outputs requested in the ANSWER.md file
