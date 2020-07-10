FROM alpine:latest
RUN apk update && apk add --no-cache wget && \
    apk add --no-cache unzip && \
    wget https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_386.zip && \
    unzip ./terraform_0.12.20_linux_386.zip -d /usr/local/bin/ && \
    rm terraform_0.12.20_linux_386.zip
CMD ["terraform","-v"]
