FROM alpine:latest

ARG VERSION="0.12.20"
RUN wget https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_linux_amd64.zip && \
    unzip terraform_${VERSION}_linux_amd64.zip && \
    rm terraform_${VERSION}_linux_amd64.zip && \
    mv terraform /usr/bin/terraform

CMD terraform version