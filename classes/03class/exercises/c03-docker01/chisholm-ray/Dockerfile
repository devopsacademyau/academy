FROM ubuntu:latest AS build
RUN apt-get update && apt-get -y install wget && apt-get -y install unzip
RUN wget https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip
RUN unzip terraform_0.12.20_linux_amd64.zip && rm terraform_0.12.20_linux_amd64.zip
RUN chmod +x terraform
RUN mv terraform /usr/bin/terraform

FROM alpine:latest
COPY --from=build /usr/bin/terraform /usr/bin/terraform
CMD terraform version



