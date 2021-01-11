#!/bin/sh

set -e

echo "${NGX_HTTP_ACCESS}" > /etc/nginx/http-access.conf
echo "${NGX_HTPASSWD}" > /etc/nginx/htpasswd

/usr/local/bin/confd -onetime -backend env

exec "$@"
