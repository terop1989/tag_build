ARG LINUX_BASE=registry.access.redhat.com/ubi8/ubi
FROM ${LINUX_BASE}

USER root

ENV TZ="Europe/Moscow"

ARG PHP=7.2

RUN dnf --disableplugin=subscription-manager config-manager --disable epel-debuginfo epel-source; exit 0; \
    dnf --disableplugin=subscription-manager module enable -y php:${PHP}
RUN dnf --disableplugin=subscription-manager --setopt=tsflags=nodocs -y install \
        php \
        php-fpm \
        php-common \
        php-cli \
        php-xml \
        php-mbstring \
        php-json \
        php-zip \
        php-gd \
        php-opcache \
        && \
    dnf clean all
