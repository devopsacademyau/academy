FROM alpine:3.11.5
WORKDIR /tmp
RUN apk add wget unzip
RUN wget https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip
RUN unzip ./terraform_0.12.20_linux_amd64.zip -d /usr/local/bin/
CMD ["terraform", "-v"]