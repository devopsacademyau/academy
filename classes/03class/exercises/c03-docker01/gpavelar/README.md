# C03-Docker01

## Docker

- [Dockerfile](Dockerfile)

## Command Execution Output

- Command to build the image:

```bash
## Docker build command
docker build -t da-terraform:c03-docker-e01 .
```

- Command to run the image and its output.:

```bash
## Docker run
docker run -it da-terraform:c03-docker-e01

# Output
Terraform v0.12.20

Your version of Terraform is out of date! The latest version
is 0.12.28. You can update by downloading from https://www.terraform.io/downloads.html

## Listind docker images
docker images

# Output
REPOSITORY            TAG                 IMAGE ID            CREATED             SIZE
da-terraform          c03-docker-e01      718a82c47a37        25 hours ago        57.8MB
alpine                latest              a24bb4013296        7 weeks ago         5.57MB
hashicorp/terraform   0.12.20             e6dd0042ca56        5 months ago        80.1MB
```

---

Answer for exercise [c03-docker01](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker01/README.md)
