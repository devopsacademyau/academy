ARG ALPINE_VERSION=3.12
FROM alpine:${ALPINE_VERSION}
ARG TERRAFORM_VERSION=0.12.20
WORKDIR /tmp
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip
CMD [ "./terraform", "version" ]