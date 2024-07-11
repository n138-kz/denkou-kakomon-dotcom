FROM almalinux

RUN set -x && \
    dnf -y install openssl

WORKDIR /etc/ssl
ENV capass password

RUN set -x && \
    if [ ! -d /etc/ssl ] ; then mkdir /etc/ssl; fi

RUN set -x && \
    openssl genrsa -out /etc/ssl/server.key 2048

RUN set -x && \
    openssl req -new -sha256 -key /etc/ssl/server.key -out /etc/ssl/cacert.pem -keyout /etc/ssl/cakey.pem -passout env:capass -subj "/C=JP/ST=Chiba/O=myorg/CN=${DOCKERSSL_SELFSIGNED_COMMONNAME}" -x509 -days 365

RUN set -x && \
    openssl x509 -in /etc/ssl/cacert.pem -text
