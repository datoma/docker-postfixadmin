FROM alpine:3.12

LABEL description "PostfixAdmin is a web based interface used to manage mailboxes" \
      maintainer="datoma - https://github.com/datoma"

ARG POSTFIXADMIN_VERSION=3.2.4
ARG POSTFIXADMIN_SHA512=2bd7ae05addbaf3c6c7eebea16ec1e21b2c67c8e6161446ed82a9553c26c04e19c1ec9ce248a9b9df504df56d309590259e6f04907b04b593548028b40e40d47
ENV POSTFIXADMIN_VERSION $POSTFIXADMIN_VERSION
ENV POSTFIXADMIN_SHA512 $POSTFIXADMIN_SHA512

RUN echo "@community https://nl.alpinelinux.org/alpine/v3.10/community" >> /etc/apk/repositories; \
    apk -U upgrade; \
    apk add -t build-dependencies gnupg ca-certificates; \
    apk add tini@community curl su-exec dovecot php7@community php7-phar php7-fpm@community php7-imap@community php7-pgsql@community php7-mysqli@community php7-session@community php7-mbstring@community; \
    curl -fsSL -o postfixadmin.tar.gz "https://github.com/postfixadmin/postfixadmin/archive/postfixadmin-${POSTFIXADMIN_VERSION}.tar.gz"; \
    echo "$POSTFIXADMIN_SHA512 *postfixadmin.tar.gz" | sha512sum -c -; \
    mkdir /postfixadmin && tar xzf postfixadmin.tar.gz -C /postfixadmin; \
    mkdir -p /postfixadmin/templates_c; \
    mkdir -p /postfixadmin/public; \
    apk del build-dependencies; \
    rm -rf /var/cache/apk/* /tmp/* /root/.gnupg /postfixadmin/postfixadmin-$VERSION*

COPY bin /usr/local/bin
RUN chmod +x /usr/local/bin/*
EXPOSE 8888
CMD ["tini", "--", "run.sh"]
