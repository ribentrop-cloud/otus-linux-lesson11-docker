FROM node:alpine
RUN apk --update add nginx
RUN mkdir -p /run/nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
COPY index.html /var/lib/nginx/html/
COPY default.conf /etc/nginx/conf.d/

