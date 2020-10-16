FROM httpd:2.4.41

LABEL maintainer="Alan Lima"
LABEL version="v2"

RUN echo "This is my GH actions exercise" > /usr/local/apache2/htdocs/index.html