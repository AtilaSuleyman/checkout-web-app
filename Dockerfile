FROM httpd:2.4-alpine
RUN apk --no-cache add curl
COPY ./ExamplePage/ /usr/local/apache2/htdocs/