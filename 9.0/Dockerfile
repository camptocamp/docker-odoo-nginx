FROM nginxinc/nginx-unprivileged:bookworm 

ADD --chown=nginx:nginx https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd
USER root
RUN mkdir -p /etc/confd/{conf.d,templates}
RUN chown nginx:nginx /etc/confd/{conf.d,templates}
USER nginx
COPY conf.d /etc/confd/conf.d
COPY templates /etc/confd/templates
COPY docker-entrypoint.sh /docker-entrypoint.sh

VOLUME ["/var/cache/nginx"]

ENTRYPOINT ["/docker-entrypoint.sh"]

ENV NGX_ODOO_HOST=odoo
ENV NGX_ODOO_LONGPOLLING_PORT=8072
ENV NGX_CACHE_SIZE=10m

CMD ["nginx", "-g", "daemon off;"]
