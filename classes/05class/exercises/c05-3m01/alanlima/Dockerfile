FROM node:12.16.1-alpine as aws

RUN apk add --no-cache curl make python3 py-pip \
	&& pip install awscli

CMD [ "/bin/sh" ]