#Alpine docker image with Terraform

FROM alpine:3.9.5

MAINTAINER Marcio Faria <marciodefaria@gmail.com>

RUN apk add -q wget unzip \
	&& wget https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip \
	&& unzip terraform_0.12.20_linux_amd64.zip -d /usr/local/bin/ \
	&& rm -f terraform_0.12.20_linux_amd64.zip \
	&& apk del wget unzip

CMD ["terraform", "-v"]
