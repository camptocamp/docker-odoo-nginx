#!/bin/bash

set -e

echo "${NGX_HTTP_ACCESS}" > /etc/nginx/http-access.conf

exec "$@"
