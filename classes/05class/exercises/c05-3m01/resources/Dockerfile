FROM ubuntu:18.04 as aws

RUN apt-get update && apt-get install curl make unzip sudo python3 -y && \
		curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
		unzip awscliv2.zip && \
		sudo ./aws/install && \
		rm -rf /var/lib/apt/lists/*

CMD [ "bash" ]