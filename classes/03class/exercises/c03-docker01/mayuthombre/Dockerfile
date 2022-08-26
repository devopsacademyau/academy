# Download the base image with minimal size (~5 MB)
FROM alpine:3.14

# Set working directory for Terrafom app to install
WORKDIR /usr/bin

# Download Terraform installation package
RUN wget https://releases.hashicorp.com/terraform/1.2.7/terraform_1.2.7_linux_amd64.zip
# Unzip downloaded package and then detele ZIP file to save space
RUN unzip terraform_1.2.7_linux_amd64.zip && rm terraform_1.2.7_linux_amd64.zip
# Move Terraform to working directory
RUN mv terraform /usr/bin/terraform

# Verify Terraform installation & version installed
CMD ["terraform", "--version"] 