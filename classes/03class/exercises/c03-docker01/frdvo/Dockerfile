FROM debian:latest
RUN apt-get update && apt-get install -y curl unzip && cd /root && curl\
    https://releases.hashicorp.com/terraform/0.12.20/terraform_0.12.20_linux_amd64.zip\
    -o tf.zip && unzip tf.zip
FROM alpine:latest
COPY --from=0 /root/terraform /usr/bin
CMD ["terraform","version"]