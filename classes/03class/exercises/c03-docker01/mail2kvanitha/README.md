# C03-Docker01

## Docker 
- [Dockerfile](Dockerfile)

## Command Execution Output
- Command to build the image:
```
  > docker build -t da-terraform:c03-docker-e01 .
  
  Sending build context to Docker daemon  9.216kB
 Step 1/4 : FROM alpine:latest
  ---> a24bb4013296
 Step 2/4 : ARG TERRAFORM_VERSION=0.12.20
  ---> Using cache
  ---> 83d870b8f4b4
 Step 3/4 : RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip     &&  unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin     &&  rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip
  ---> Running in 05c34923fd0f
 Connecting to releases.hashicorp.com (151.101.81.183:443)
 saving to 'terraform_0.12.20_linux_amd64.zip'
 terraform_0.12.20_li  24% |*******                         | 3873k  0:00:03 ETA
 terraform_0.12.20_li  60% |*******************             | 9537k  0:00:01 ETA
 terraform_0.12.20_li  96% |******************************  | 14.8M  0:00:00 ETA
 terraform_0.12.20_li 100% |********************************| 15.4M  0:00:00 ETA
 'terraform_0.12.20_linux_amd64.zip' saved
 Archive:  terraform_0.12.20_linux_amd64.zip
   inflating: terraform
 Removing intermediate container 05c34923fd0f
  ---> 2acd9ac9216d
 Step 4/4 : CMD ["terraform", "-v"]
  ---> Running in 4f051b22f61c
 Removing intermediate container 4f051b22f61c
  ---> c50fc0cc7915
 Successfully built c50fc0cc7915
 Successfully tagged da-terraform:c03-docker-e01

```

- Command to run the image and its output.:
```

  > docker run -it da-terraform:c03-docker-e01

  Terraform v0.12.20

  Your version of Terraform is out of date! The latest version
  is 0.12.28. You can update by downloading from https://www.terraform.io/downloads.html


  > docker image ls da-terraform:c03-docker-e01
    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
    da-terraform        c03-docker-e01      c50fc0cc7915        2 days ago          56MB

```

<!-- Don't change anything below this point-->
<!-- Before commiting, remove both commented lines--> 
***
Answer for exercise [c03-docker01](https://github.com/devopsacademyau/academy/blob/af3225a3436f263164e8daebc6bbd1ef3122b900/classes/03class/exercises/c03-docker01/README.md)
