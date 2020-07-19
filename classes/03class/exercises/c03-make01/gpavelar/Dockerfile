FROM httpd:2.4.41-alpine
ARG REGISTRY
ENV REGISTRY ${REGISTRY}
ARG TAG
ENV TAG ${TAG}
RUN rm /usr/local/apache2/htdocs/index.html
RUN echo "<b>This image was created by ${REGISTRY}, based on the ${TAG} <b>" > /usr/local/apache2/htdocs/index.html