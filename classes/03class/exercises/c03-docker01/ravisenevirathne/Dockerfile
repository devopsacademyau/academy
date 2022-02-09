#Using ubuntu as base image 
FROM ubuntu:latest as builder
#package update + installing unzip & wget
RUN apt-get update -y && apt-get install unzip -y && apt-get install wget -y
#download terraform 0.12.20
RUN wget https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip
#unzip file
RUN unzip terraform_0.12.20_linux_amd64.zip
#move to local bin
RUN mv terraform /usr/bin/terraform

#using lightweight alpine image as a multi-stage build
FROM alpine:latest
#copy from builder ubuntu image bin folder to alpine bin 
COPY --from=builder /usr/bin/terraform /usr/bin/terraform
#check the terraform version
CMD terraform version

#Ref - https://gist.github.com/gsweene2/aa4229c163d500965e5674ee4418bf7a