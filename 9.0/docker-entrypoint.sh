#!/bin/sh

set -e

echo "${NGX_HTTP_ACCESS}" > /etc/nginx/http-access.conf
echo "${NGX_HTPASSWD}" > /etc/nginx/htpasswd

export NGX_CACHE_SIZE=${NGX_CACHE_SIZE:-10m}

/usr/local/bin/confd -onetime -backend env

echo ${NGX_SPECIFIC_SERVER_CONFIG:-"#NO specific configuration defined"} > /etc/nginx/specific_server_config.conf

if [[ -n "${NGX_PROMETHEUS_EXPORTER}" ]]
then
    echo "access_log '/var/log/nginx/access_prometheus.log' prometheus_exporter;" > /etc/nginx/prometheus_eporter.conf

    /usr/local/bin/prometheus-nginxlog-exporter -config-file /etc/prometheus-nginxlog-exporter.hcl &
else
    touch /etc/nginx/prometheus_eporter.conf
fi

exec "$@"
