FROM alpine:3.12

ENV TF_VERSION=0.12.20

RUN set -euxo pipefail ;\
    apk add --no-cache --update unzip dumb-init su-exec ;\
    wget https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip ;\
    unzip terraform_${TF_VERSION}_linux_amd64.zip -d /usr/bin ;\
    rm -f terraform_${TF_VERSION}_linux_amd64.zip ;\
    apk del --no-cache --purge unzip ;\
    rm -rf /var/cache/apk/* ;\
    rm -rf /root/.cache ;\
    rm -rf /tmp/* ;\
    rm -rf /var/tmp/* ;\
    adduser -s /bin/sh -u 1000 -D -h /terraform terraform

WORKDIR /terraform
ENTRYPOINT ["/usr/bin/dumb-init","--"]
CMD ["sh", "-c", "terraform version && exec su-exec terraform /bin/sh"]

