from  alpine:3.16

LABEL author="dugonzal" 

run  apk add && apk update --no-cache
run  apk upgrade && apk add curl tar --no-cache

RUN curl -L  https://wordpress.org/latest.tar.gz | tar -xzv 

RUN mv wordpress/ /var/www/

CMD ["sleep", "infinity"]
