# HISTORY

## Unreleased

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
