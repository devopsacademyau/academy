FROM alpine:3.7

WORKDIR /usr/src/app

RUN apk update \
    && apk add wget unzip \
    && wget https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip \ 
    && unzip ./terraform_0.12.20_linux_amd64.zip -d /usr/local/bin/ \
    && rm  -f terraform_0.12.20_linux_amd64.zip

CMD [ "terraform", "-v" ]