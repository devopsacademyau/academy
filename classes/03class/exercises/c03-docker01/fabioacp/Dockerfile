FROM alpine:3.12

ENV TERRAFORM_VERSION=0.12.20

RUN set -x                                                                                                              && \
                                                                                                                           \
# Install build tools, libraries and utilities                                                                             \
    apk add --no-cache --virtual .build-deps                                                                               \
        unzip                                                                                                              \
        wget                                                                                                            && \
# Retrieve and unzip                                                                                                       \
    TMP="$(mktemp -d)" && cd "$TMP"                                                                                     && \
    wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip   && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip  -d /usr/local/bin/                                            && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip                                                                && \
    apk del .build-deps 
CMD [ "terraform", "--version" ]
