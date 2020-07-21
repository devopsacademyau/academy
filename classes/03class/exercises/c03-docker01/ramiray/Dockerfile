# Setup build arguments with terraform version=0.12.20
ARG TERRAFORM_VERSION=0.12.20

# Download and install Terraform binary
FROM alpine:3.7
RUN apk update && apk add curl
RUN curl -Os https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /usr/local/bin/terraform && \
    rm -rf terraform_${TERRAFORM_VERSION}_linux_amd64.zip
CMD [ "terraform", "-v"]




