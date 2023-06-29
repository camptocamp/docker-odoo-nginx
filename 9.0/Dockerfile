FROM docker.io/nginx:alpine
MAINTAINER Camptocamp

ADD https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd

RUN mkdir -p /etc/confd/{conf.d,templates}
COPY conf.d /etc/confd/conf.d
COPY templates /etc/confd/templates
COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN apk add logrotate

WORKDIR /tmp
RUN wget https://github.com/martin-helmich/prometheus-nginxlog-exporter/releases/download/v1.10.0/prometheus-nginxlog-exporter_1.10.0_linux_amd64.tar.gz
RUN tar xvzfp prometheus-nginxlog-exporter_1.10.0_linux_arm64.tar.gz
RUN mv /tmp/prometheus-nginxlog-exporter /usr/local/bin/
RUN rm -rf /tmp/prometheus-nginxlog-exporter /tmp/prometheus-nginxlog-exporter_1.10.0_linux_arm64.tar.gz
WORKDIR /

VOLUME ["/var/cache/nginx"]

ENTRYPOINT ["/docker-entrypoint.sh"]

ENV NGX_ODOO_HOST=odoo
ENV NGX_ODOO_LONGPOLLING_PORT=8072

CMD ["nginx", "-g", "daemon off;"]
