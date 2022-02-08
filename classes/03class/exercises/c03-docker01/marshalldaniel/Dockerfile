FROM alpine:3.15.0
ADD https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip /tmp
RUN apk add unzip \
  && unzip /tmp/terraform_0.12.20_linux_amd64.zip -d /usr/local/bin \
  && rm /tmp/terraform_0.12.20_linux_amd64.zip
CMD terraform -version