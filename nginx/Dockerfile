FROM nginx:latest

EXPOSE 80

RUN rm -rf /etc/nginx/conf.d
COPY conf.d/ /etc/nginx/conf.d
VOLUME ["/static"]