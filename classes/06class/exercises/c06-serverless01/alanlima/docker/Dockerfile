ARG AMAZON_LINUX_VERSION=2.0.20200722.0

FROM amazonlinux:${AMAZON_LINUX_VERSION} as installer

ARG TERRAFORM_VERSION=0.13.2

WORKDIR /tmp

RUN yum update -y \
    && yum install -y unzip \
    && curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscli.zip \
    && unzip awscli.zip \
    && ./aws/install --bin-dir ./aws-cli-bin/ \
    && curl "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" -o terraform.zip \
    && unzip terraform.zip

FROM amazonlinux:${AMAZON_LINUX_VERSION}

COPY --from=installer /usr/local/aws-cli/ /usr/local/aws-cli/
COPY --from=installer /tmp/aws-cli-bin/ /usr/local/bin/
COPY --from=installer /tmp/terraform /usr/bin/
RUN yum update -y \
    && yum install -y less groff jq make \
    && yum clean all

ENTRYPOINT [ "/bin/sh", "-c" ]
CMD [ "sh" ]