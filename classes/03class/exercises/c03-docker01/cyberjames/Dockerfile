FROM alpine:latest AS builder

# download the terraform from remote repo, unzip then remove the source zip
RUN cd /usr/local/bin && \
    echo "Getting TF package from remote repo..." && \
    wget https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip && \
    echo "Unzipping TF package..." && \
    unzip terraform_0.12.20_linux_amd64.zip && \
    echo "Removing source TF zipped package..." && \
    rm terraform_0.12.20_linux_amd64.zip

FROM builder as runtime
# return terraform version to shell at runtime
ENTRYPOINT terraform version