#!/bin/sh

set -e

echo "${NGX_HTTP_ACCESS}" > /etc/nginx/http-access.conf
echo "${NGX_HTPASSWD}" > /etc/nginx/htpasswd

# Default the resolver to the nameserver(s) of the container, so that the
# X-Accel-Redirect proxying works both with the Docker embedded DNS
# (127.0.0.11) and with the Kubernetes cluster DNS.
if [ -z "${NGINX_RESOLVER:-}" ]; then
  NGINX_RESOLVER=$(awk 'BEGIN{ORS=" "} $1=="nameserver" {if ($2 ~ ":") {print "["$2"]"} else {print $2}}' /etc/resolv.conf)
  export NGINX_RESOLVER="${NGINX_RESOLVER% }"
fi

/usr/local/bin/confd -onetime -backend env

exec "$@"
