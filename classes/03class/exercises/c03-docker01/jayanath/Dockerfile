FROM alpine:latest
RUN apk --update --no-cache add curl
ENV TER_VER=0.12.20
RUN cd /usr/local/bin && \
    curl -O https://releases.hashicorp.com/terraform/${TER_VER}/terraform_${TER_VER}_linux_amd64.zip && \
    unzip terraform_${TER_VER}_linux_amd64.zip && \
    rm terraform_${TER_VER}_linux_amd64.zip
CMD [ "terraform", "-v" ]

