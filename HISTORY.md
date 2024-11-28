# HISTORY

## Unreleased


## 1.10.0

* Bump base to fix remote execution bug
* Use github action for build
* Remove curl from pacakges 

## 1.9.2

* Fix cache size for header, increased for new odoo images 

## 1.9.1

* fix websocket for v16 

## 1.9.0

* Switch from alpine to debian bookworn
* Change directory for base config
* Add cache size parameter
* Add pdfcontent parameter (see README.md)

## 1.8.3

* Fix json logs 

## 1.8.2

* Fix longpolling env get 

## 1.8.1

* add configurable longpolling port (default: 8072) 

## 1.8.0

* add websock location for odoo 16.0 

## 1.6.0

* Mute healthcheck query logging

## 1.5.0

* Switch to alpine as base image
* Fix empty responses sent by nginx which caches a 304 response with 0 bytes
  from the backend instead of the last 200 response.

## 1.4.0

* Output the following log keys with numeric values: response, bytes,
  time_request, time_backend_connect, time_backend_response

## 1.3.0

* Change log keys to match apache's keys

The goal is to have the same keys for Apache and Nginx so we can have
similar logstash configuration and kibana boards.
All the keys share the Apache's ones but the "time_*" which are the same
than the HAproxy's ones, because we don't have them in Apache.


## 1.2.3

Upgrade!

1.2.0-1.2.2 were all subjects to issues with the cache.

This version fixes an issue in 1.2.2 with attachments, which could not be
downloaded due to the cookie not being passed through /web/content.

It also fixes an error when getting /website/translations, this endpoint is not
cached anymore.


## 1.2.2

Upgrade!

* Fix a severe issue with cache and Set-Cookie. Odoo returns static
  files with a Set-Cookie header. Nginx was caching this header and
  returning it to the clients which led to user sessions swaps.

  The new configuration ignore this header.

* Reduce data passing between odoo and nginx by letting odoo know the client
  header "If-None-Match" so it can return a 304 when the content didn't change

## 1.2.1

* Avoid unwanted 404 when requesting cached resources
* Add ability to bypass cache with `Cache-Control` header

## 1.2.0

* Fix and optimize static files caching
* Optimize request buffering
* Change logs format to JSON

## 1.1.0

* Add `NGX_ODOO_HOST` to change the hostname of the proxypass

## 1.0.0

Initial release

* Odoo configuration for http with longpolling and caching of /web/static
* Customizable http accesses
