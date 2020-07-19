FROM alpine:3.12.0
RUN apk update \
  #get or update wget and unzip
  && apk add --no-cache wget unzip \
  #get the terraform zip file
  && wget https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip --output-file terraform.zip \
  #unzip / extract the file
  && unzip ./terraform_0.12.20_linux_amd64.zip -d /usr/local/bin/ \
  #remove the zip file
  && rm -f terraform.zip 
  # get version of terraform
CMD ["terraform", "--version"]


