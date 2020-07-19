FROM alpine:latest as downloader
WORKDIR /app/
ADD https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip /app
RUN unzip /app/terraform_0.12.20_linux_amd64.zip
FROM alpine:latest as builder
WORKDIR /app/
COPY --from=0 /app/terraform .
CMD ["/app/terraform", "--version"]