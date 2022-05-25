FROM alpine:3.16
RUN wget https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip \
&& unzip ./terraform_0.12.20_linux_amd64.zip -d /usr/local/bin/ \
&& rm terraform_0.12.20_linux_amd64.zip 
CMD ["terraform", "--version"]