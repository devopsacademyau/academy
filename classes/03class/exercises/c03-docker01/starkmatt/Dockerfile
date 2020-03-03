FROM alpine:latest
WORKDIR /usr
RUN echo "Installing Alpine & Terraform"
RUN apk add zip && \
apk add curl && \
curl --url https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_386.zip --output terraform.zip && \
unzip terraform.zip && \
chmod +x terraform && \
mv terraform /usr/bin && \
rm -f terraform.zip && \
apk del zip 
CMD ["terraform", "--version"]
