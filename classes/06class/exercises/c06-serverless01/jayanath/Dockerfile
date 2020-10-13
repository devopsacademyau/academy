FROM ubuntu:20.10 as aws

RUN apt update && apt install curl make unzip sudo python3 -y && \
		curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
		unzip awscliv2.zip && \
		sudo ./aws/install && \
		curl "https://releases.hashicorp.com/terraform/0.13.2/terraform_0.13.2_linux_amd64.zip" -o "terraform.zip" && \
		unzip terraform.zip && \
		sudo mv terraform /usr/local/bin && \
		rm -rf /var/lib/apt/lists/* && \
		rm terraform.zip

CMD [ "bash" ]