FROM alpine:3.9.5
WORKDIR /usr
RUN apk add wget unzip \
    && wget -O terraform.zip https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip \
    && unzip terraform.zip -d /usr/local/bin/ \
    && rm -f terraform.zip \
    && apk del wget unzip
CMD ["terraform", "-v"]
