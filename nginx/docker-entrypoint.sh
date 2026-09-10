#!/bin/sh

set -e

echo "${NGX_HTTP_ACCESS}" > /etc/nginx/http-access.conf
echo "${NGX_HTPASSWD}" > /etc/nginx/htpasswd

# "localhost" resolves to both 127.0.0.1 and ::1, and nginx resolves the
# proxy_pass hostname at startup into an upstream group with both addresses.
# When Odoo only listens on IPv4, every request first fails on ::1 and logs a
# "connect() failed (111: Connection refused)" error before falling back to
# 127.0.0.1. Use the IPv4 loopback address directly to avoid this.
if [ "${NGX_ODOO_HOST:-}" = "localhost" ]; then
  export NGX_ODOO_HOST=127.0.0.1
fi

/usr/local/bin/confd -onetime -backend env

exec "$@"
