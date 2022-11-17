FROM docker.io/nginx:alpine
MAINTAINER Camptocamp

ADD https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd

RUN mkdir -p /etc/confd/{conf.d,templates}
COPY conf.d /etc/confd/conf.d
COPY templates /etc/confd/templates
COPY docker-entrypoint.sh /docker-entrypoint.sh

VOLUME ["/var/cache/nginx"]

ENTRYPOINT ["/docker-entrypoint.sh"]

ENV NGX_ODOO_HOST=odoo
ENV NGX_ODOO_LONGPOLLING_PORT=8072

CMD ["nginx", "-g", "daemon off;"]
