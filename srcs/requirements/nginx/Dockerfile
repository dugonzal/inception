
FROM alpine:3.18.5

RUN apk update && apk upgrade --no-cache  && apk add nginx openssl zsh --no-cache

RUN mkdir /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -sha256 \
  -keyout /etc/nginx/ssl/openssl.key \
  -out /etc/nginx/ssl/openssl.crt \
  -subj "/C=SP/ST=Madrid/L=Bilbao/O=42/OU=IT/CN=dugonzal.42.fr/" \
  && chown -R nginx:nginx /etc/nginx/ssl

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]

