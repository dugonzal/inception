
FROM alpine:3.18.5

RUN apk update && apk upgrade --no-cache  && apk add zsh=5.9-r2 openssl=3.1.4-r1 nginx=1.24.0-r7 --no-cache

RUN mkdir /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -subj "/C=ES/ST=Urduliz/L=Madrid/O=42Urduliz/OU=42Urduliz/CN=dugonzal.42.fr" \
  -keyout /etc/nginx/ssl/openssl.key  -out /etc/nginx/ssl/openssl.crt && \
  chmod 600 /etc/nginx/ssl/*

COPY ./conf/nginx.conf /etc/nginx/http.d/default.conf

RUN mkdir -p /var/www/wordpress || sleep 10

RUN chown -R nginx:nginx /var/www/wordpress

CMD ["nginx", "-g", "daemon off;"]

