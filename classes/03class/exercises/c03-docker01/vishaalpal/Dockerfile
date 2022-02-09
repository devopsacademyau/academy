# Define the base image used to build our new image
FROM alpine:latest
# Set the working directory to execute the below commands
WORKDIR /usr/local/bin
# Install the packages curl and unzip. Download the Terraform CLI zip file, unzip it and then delete it. 
RUN apk --no-cache add curl && \
    apk add unzip && \
    curl -O https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip && \
    unzip terraform_0.12.20_linux_amd64.zip && \
    rm terraform_0.12.20_linux_amd64.zip
# Run the commands below "param1", "param2".
CMD ["terraform", "-v"]