FROM httpd:2.4.41-alpine
ARG index_content
RUN echo $index_content > /usr/local/apache2/htdocs/index.html
EXPOSE 80