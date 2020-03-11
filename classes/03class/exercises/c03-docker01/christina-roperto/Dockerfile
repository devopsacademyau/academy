FROM alpine:latest

RUN wget https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip
RUN unzip terraform_0.12.20_linux_amd64.zip
RUN rm terraform_0.12.20_linux_amd64.zip

CMD ./terraform --version
