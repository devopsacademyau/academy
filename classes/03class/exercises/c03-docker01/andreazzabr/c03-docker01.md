c03-docker01

FROM alpine:3.9.5
WORKDIR tmp
RUN wget https://releases.hashicorp.com/terraform/0.12.23/terraform_0.12.23_linux_amd64.zip && \
    unzip ./terraform_0.12.23_linux_amd64.zip -d /usr/local/bin/ && \
    rm -rf ./terraform_0.12.23_linux_amd64.zip
CMD terraform -v


anderson@andreazza:~/dockeroos$ sudo docker build -t da-terraform:c03-docker-e01 . -f dockerfile
Sending build context to Docker daemon  2.048kB
Step 1/4 : FROM alpine:3.9.5
 ---> 82f67be598eb
Step 2/4 : WORKDIR tmp
 ---> Running in b836131c34b1
Removing intermediate container b836131c34b1
 ---> 3d3673109aa8
Step 3/4 : RUN wget https://releases.hashicorp.com/terraform/0.12.23/terraform_0.12.23_linux_amd64.zip &&     unzip ./terraform_0.12.23_linux_amd64.zip -d /usr/local/bin/ &&     rm -rf ./terraform_0.12.23_linux_amd64.zip
 ---> Running in 2a9839269484
Connecting to releases.hashicorp.com (151.101.29.183:443)
terraform_0.12.23_li   0% |                                | 65536  0:04:11 ETA
terraform_0.12.23_li   7% |**                              | 1220k  0:00:24 ETA
terraform_0.12.23_li  15% |****                            | 2468k  0:00:16 ETA
terraform_0.12.23_li  23% |*******                         | 3788k  0:00:13 ETA
terraform_0.12.23_li  31% |**********                      | 5100k  0:00:10 ETA
terraform_0.12.23_li  40% |************                    | 6488k  0:00:08 ETA
terraform_0.12.23_li  49% |***************                 | 7912k  0:00:07 ETA
terraform_0.12.23_li  57% |******************              | 9272k  0:00:05 ETA
terraform_0.12.23_li  65% |********************            | 10.3M  0:00:04 ETA
terraform_0.12.23_li  74% |***********************         | 11.6M  0:00:03 ETA
terraform_0.12.23_li  82% |**************************      | 12.9M  0:00:02 ETA
terraform_0.12.23_li  91% |*****************************   | 14.3M  0:00:01 ETA
terraform_0.12.23_li 100% |********************************| 15.7M  0:00:00 ETA

Archive:  ./terraform_0.12.23_linux_amd64.zip
  inflating: terraform
Removing intermediate container 2a9839269484
 ---> b4dddea6a55a
Step 4/4 : CMD terraform -v
 ---> Running in 4da570428b54
Removing intermediate container 4da570428b54
 ---> e599e2ee6d77
Successfully built e599e2ee6d77
Successfully tagged da-terraform:c03-docker-e01
anderson@andreazza:~/dockeroos$ sudo docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
da-terraform        c03-docker-e01      e599e2ee6d77        8 seconds ago       56.9MB
alpine              3.9.5               82f67be598eb        6 weeks ago         5.53MB
anderson@andreazza:~/dockeroos$ sudo docker run -it da-terraform:c03-docker-e01
Terraform v0.12.23




## Submit a PR with the following files:
- Dockerfile: used to create the image
- c03-docker01.txt: Containing the commands used to build and execute the image, as well as the output of container execution.
