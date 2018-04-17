# docker-odoo-nginx

An image that includes a configuration file set up to run with Odoo.

The configuration file should work from Odoo 8.0 to 11.0

## Configuration

### Odoo host name

By default, nginx is configured to proxy pass on the host named "odoo".
This can be changed with the environment variable `NGX_ODOO_HOST`.

### HTTP accesses

Custom access allow/deny can be configured using the environment variable `NGX_HTTP_ACCESS` with using a multiline content such as:

```
deny 192.168.1.1;
allow 192.168.1.0/24;
deny all;
```
