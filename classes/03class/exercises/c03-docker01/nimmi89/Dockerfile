FROM alpine:3.12.0
ENV TERRAFORM_VER 0.12.20
RUN apk update && apk add curl \
    wget \
    unzip 
RUN wget --quiet https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/terraform_${TERRAFORM_VER}_linux_amd64.zip \
  && unzip terraform_${TERRAFORM_VER}_linux_amd64.zip \
  && mv terraform /usr/bin \
  && rm terraform_${TERRAFORM_VER}_linux_amd64.zip
CMD ["terraform", "-version"]
