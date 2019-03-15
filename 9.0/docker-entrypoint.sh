#!/bin/sh

set -e

echo "${NGX_HTTP_ACCESS}" > /etc/nginx/http-access.conf

/usr/local/bin/confd -onetime -backend env

exec "$@"
