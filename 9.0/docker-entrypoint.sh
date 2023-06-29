#!/bin/sh

set -e

echo "${NGX_HTTP_ACCESS}" > /etc/nginx/http-access.conf
echo "${NGX_HTPASSWD}" > /etc/nginx/htpasswd

/usr/local/bin/confd -onetime -backend env

if [[ -z "${NGX_SPECIFIC_CACHE}" ]] 
then 
    echo "CREATE empty /etc/nginx/specific_cache.conf"
    touch /etc/nginx/specific_cache.conf
else
    echo "OVERRIDE /etc/nginx/specific_cache.conf"
    echo "${NGX_SPECIFIC_CACHE}" > /etc/nginx/specific_cache.conf
fi

exec "$@"
